[Ivy]
17844EE777AE68B9 9.4.1 #module
>Proto >Proto Collection #zClass
Ts0 TasksProcess Big #zClass
Ts0 RD #cInfo
Ts0 #process
Ts0 @TextInP .colors .colors #zField
Ts0 @TextInP color color #zField
Ts0 @AnnotationInP-0n ai ai #zField
Ts0 @TextInP .type .type #zField
Ts0 @TextInP .processKind .processKind #zField
Ts0 @TextInP .xml .xml #zField
Ts0 @TextInP .responsibility .responsibility #zField
Ts0 @UdInit f0 '' #zField
Ts0 @UdProcessEnd f1 '' #zField
Ts0 @PushWFArc f2 '' #zField
Ts0 @UdEvent f3 '' #zField
Ts0 @UdExitEnd f4 '' #zField
Ts0 @PushWFArc f5 '' #zField
>Proto Ts0 Ts0 TasksProcess #zField
Ts0 f0 guid 17844EE777F40C61 #txt
Ts0 f0 method start(java.util.List<com.microsoft.graph.MicrosoftGraphTodoTask>) #txt
Ts0 f0 inParameterDecl '<java.util.List<com.microsoft.graph.MicrosoftGraphTodoTask> todo> param;' #txt
Ts0 f0 inParameterMapAction 'out.todo=param.todo;
' #txt
Ts0 f0 outParameterDecl '<> result;' #txt
Ts0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start(List&lt;MicrosoftGraphTodoTask&gt;)</name>
    </language>
</elementInfo>
' #txt
Ts0 f0 83 51 26 26 -118 15 #rect
Ts0 f1 211 51 26 26 0 12 #rect
Ts0 f2 109 64 211 64 #arcP
Ts0 f3 guid 17844EE77876EF97 #txt
Ts0 f3 actionTable 'out=in;
' #txt
Ts0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>close</name>
    </language>
</elementInfo>
' #txt
Ts0 f3 83 147 26 26 -16 15 #rect
Ts0 f4 211 147 26 26 0 12 #rect
Ts0 f5 109 160 211 160 #arcP
>Proto Ts0 .type msgraph.todo.demo.Tasks.TasksData #txt
>Proto Ts0 .processKind HTML_DIALOG #txt
>Proto Ts0 -8 -8 16 16 16 26 #rect
Ts0 f0 mainOut f2 tail #connect
Ts0 f2 head f1 mainIn #connect
Ts0 f3 mainOut f5 tail #connect
Ts0 f5 head f4 mainIn #connect
