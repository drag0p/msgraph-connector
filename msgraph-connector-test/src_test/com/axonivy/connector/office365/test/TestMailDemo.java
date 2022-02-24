package com.axonivy.connector.office365.test;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.junit.jupiter.api.Test;

import com.axonivy.connector.office365.msgraph.demo.MailDemo;
import com.microsoft.graph.MicrosoftGraphMessage;

import ch.ivyteam.ivy.bpm.engine.client.BpmClient;
import ch.ivyteam.ivy.bpm.engine.client.ExecutionResult;
import ch.ivyteam.ivy.bpm.engine.client.element.BpmElement;
import ch.ivyteam.ivy.bpm.exec.client.IvyProcessTest;
import ch.ivyteam.ivy.environment.AppFixture;
import ch.ivyteam.ivy.security.ISession;
import msgraph.connector.NewMail;

@IvyProcessTest
public class TestMailDemo
{

// NEEDS TO BE FIXED
//  @BeforeEach
//  void beforeEach(AppFixture fixture) {
//    //Disable OAuth feature for mock rest service
//    fixture.config("RestClients.Microsoft 365 (Partial Graph API).Features", "ch.ivyteam.ivy.rest.client.mapper.JsonFeature");
//    fixture.config("RestClients.Microsoft 365 (Partial Graph API).Properties.AUTH.baseUri", "{ivy.app.baseurl}/api/graphAuthMock");
//    //fixture.config("RestClients.Microsoft 365 (Partial Graph API).Features", "ch.ivyteam.ivy.rest.security.CsrfHeaderFeature");
//    fixture.config("RestClients.Microsoft 365 (Partial Graph API).Url", "http://{ivy.engine.host}:{ivy.engine.http.port}/{ivy.request.application}/api/graphMock");
//    //fixture.var("Twitter-connector.Url", "{ivy.app.baseurl}/api/twitterMock");
//  }

  @SuppressWarnings("removal")
  @Test
  public void readInbox(BpmClient bpmClient, ISession session, AppFixture fixture)
  {
    fixture.environment("dev-axonivy");

    ExecutionResult result = bpmClient.start()
      .process("Demo/ms365Mail/inbox.ivp")
      .as().session(session)
      .execute();
    assertThat(result.http().redirectLocation()).containsSubsequence(
      "http://localhost:",
      "scope=user.read");

    BpmElement inboxViewer = BpmElement.pid("17F262FCF88E26A2-f12");
    bpmClient.mock().element(inboxViewer).withNoAction();
    ExecutionResult result2 = bpmClient.start()
      .webPage(result.workflow().executedTask(), resume("f3"))
      .withParam("code", "a-test-code")
      .as().session(session)
      .execute();

    MailDemo mail = result2.data().last();
    assertThat(mail.getMails()).hasSize(1);
    MicrosoftGraphMessage githubMail = mail.getMails().get(0);
    assertThat(githubMail.getSubject()).startsWith("Re:");
  }

  @SuppressWarnings("removal")
  @Test
  public void writeMail(BpmClient bpmClient, ISession session, AppFixture fixture)
  {
    fixture.environment("dev-axonivy");
    mockMailUi(bpmClient);

    ExecutionResult result = bpmClient.start()
      .process("Demo/ms365Mail/writeMail.ivp")
      .as().session(session)
      .execute();
    ExecutionResult result2 = bpmClient.start()
      .webPage(result.workflow().executedTask(), resumeSub("f7"))
      .withParam("code", "a-test-code")
      .as().session(session)
      .execute();

    assertThat(result2.bpmError()).isNull();
  }

  private void mockMailUi(BpmClient bpmClient)
  {
    NewMail mail = new NewMail();
    mail.setReceivers(List.of("me@mailinator.com"));
    mail.setSubject("Meet for Lunch?");
    mail.setBody("the new cafeteria is open");
    bpmClient.mock()
    .element(BpmElement.pid("17F262FCF88E26A2-f14"))
    .with((in,out) -> {
      try
      {
        in.set("mail", mail);
      }
      catch (NoSuchFieldException ex)
      {
      }});
  }

  private static String resume(String restActivityFieldId)
  {
    return "17F262FCF88E26A2/17F262FCF88E26A2-"+restActivityFieldId+"/resume.ivp";
  }

  private static String resumeSub(String restActivityFieldId)
  {
    return "1783B782896F7AC3/1783B782896F7AC3-"+restActivityFieldId+"/resume.ivp";
  }
}
