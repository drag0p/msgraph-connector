[Ivy]
178353D927DCBAD7 9.4.1 #module
>Proto >Proto Collection #zClass
Es0 EventsProcess Big #zClass
Es0 RD #cInfo
Es0 #process
Es0 @TextInP .colors .colors #zField
Es0 @TextInP color color #zField
Es0 @AnnotationInP-0n ai ai #zField
Es0 @TextInP .type .type #zField
Es0 @TextInP .processKind .processKind #zField
Es0 @TextInP .xml .xml #zField
Es0 @TextInP .responsibility .responsibility #zField
Es0 @UdInit f0 '' #zField
Es0 @UdProcessEnd f1 '' #zField
Es0 @PushWFArc f2 '' #zField
Es0 @UdEvent f3 '' #zField
Es0 @UdExitEnd f4 '' #zField
Es0 @PushWFArc f5 '' #zField
>Proto Es0 Es0 EventsProcess #zField
Es0 f0 guid 178353D928F6A393 #txt
Es0 f0 method start(java.util.List<com.microsoft.graph.MicrosoftGraphEvent>) #txt
Es0 f0 inParameterDecl '<java.util.List<com.microsoft.graph.MicrosoftGraphEvent> events> param;' #txt
Es0 f0 inParameterMapAction 'out.events=param.events;
' #txt
Es0 f0 outParameterDecl '<> result;' #txt
Es0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start(List&lt;MicrosoftGraphEvent&gt;)</name>
    </language>
</elementInfo>
' #txt
Es0 f0 83 51 26 26 -34 21 #rect
Es0 f1 211 51 26 26 0 12 #rect
Es0 f2 109 64 211 64 #arcP
Es0 f3 guid 178353D929FF88B8 #txt
Es0 f3 actionTable 'out=in;
' #txt
Es0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>close</name>
    </language>
</elementInfo>
' #txt
Es0 f3 83 147 26 26 -16 15 #rect
Es0 f4 211 147 26 26 0 12 #rect
Es0 f5 109 160 211 160 #arcP
>Proto Es0 .type msgraph.calendar.demo.Events.EventsData #txt
>Proto Es0 .processKind HTML_DIALOG #txt
>Proto Es0 -8 -8 16 16 16 26 #rect
Es0 f0 mainOut f2 tail #connect
Es0 f2 head f1 mainIn #connect
Es0 f3 mainOut f5 tail #connect
Es0 f5 head f4 mainIn #connect
