EMMA                 �      %P     *com/chmod0/manpages/OnManpageClickListener com/chmod0/manpages OnManpageClickListener;�D���@� OnManpageClickListener.java    <init> '(Lcom/chmod0/manpages/ManualActivity;)V                             onItemClick 4(Landroid/widget/AdapterView;Landroid/view/View;IJ)V                          %com/chmod0/manpages/BrowserActivity$1 com/chmod0/manpages BrowserActivity$1M�F{� BrowserActivity.java    <init> >(Lcom/chmod0/manpages/BrowserActivity;Landroid/app/Activity;)V          	         :   : onProgressChanged (Landroid/webkit/WebView;I)V                         >   =   <      ?      @   < 6com/chmod0/manpages/EmmaInstrument/EmmaInstrumentation "com/chmod0/manpages/EmmaInstrument EmmaInstrumentation�Qwj
MG EmmaInstrumentation.java    <init> ()V                            !    onCreate (Landroid/os/Bundle;)V                         (   &   %      *   )      0   /   .   -   % onStart ()V                   6   5   ;   :   9   8   5 getBooleanArgument ((Landroid/os/Bundle;Ljava/lang/String;)Z                               ?   >      ?      ?      ?      ?   > generateCoverageReport ()V                               5         a   T   G   Q   E   P      V   a   U      W   a   X      a   Z   Y      a   \   [      a   ^   ]      `   _      b   E getCoverageFilePath ()Ljava/lang/String;                         e      f      h   e setCoverageFilePath (Ljava/lang/String;)Z                            m      m      o   n      q   m reportEmmaError (Ljava/lang/Exception;)V                   v   u   u reportEmmaError *(Ljava/lang/String;Ljava/lang/Exception;)V                   }   {   z   y   y onActivityFinished ()V                         �   �      �      �   �   � dumpIntermediateCoverage (Ljava/lang/String;)V                               �   �      �      �      �   �      �   � <clinit> ()V                       #com/chmod0/manpages/BrowserActivity com/chmod0/manpages BrowserActivity�=j�R*&� BrowserActivity.java    <init> ()V                       �     onCreate (Landroid/os/Bundle;)V                   K         D   ,   *   (   &   :   7   5   3   1   .      F   E      I   H      K   M   & 	onKeyDown (ILandroid/view/KeyEvent;)Z                            R      R      T   S      X   R onCreateOptionsMenu (Landroid/view/Menu;)Z                   a   `   ` onOptionsItemSelected (Landroid/view/MenuItem;)Z                            j   i      m   l   s   r   q   o   n      x   w   v   u   y      |   i :com/chmod0/manpages/EmmaInstrument/SMSInstrumentedReceiver "com/chmod0/manpages/EmmaInstrument SMSInstrumentedReceiverx��\{5w SMSInstrumentedReceiver.java    <init> ()V                       	onReceive 4(Landroid/content/Context;Landroid/content/Intent;)V                	                           &    <clinit> ()V                       %com/chmod0/manpages/RotationAwareTask com/chmod0/manpages RotationAwareTask��d��h5( RotationAwareTask.java    <init> '(Lcom/chmod0/manpages/ManualActivity;)V          	                      detach ()V                          attach '(Lcom/chmod0/manpages/ManualActivity;)V                   '   &   & "com/chmod0/manpages/ExtractZipTask com/chmod0/manpages ExtractZipTaskB�?>
U�R ExtractZipTask.java   	 <init> K(Lcom/chmod0/manpages/ManualActivity;Ljava/lang/String;Ljava/lang/String;)V                                          doInBackground #([Ljava/lang/Void;)Ljava/lang/Void;                                                 '   &   %      (      *   )   ,      -      1   /      1      2   1      6   5   7      =   :      <   ;      >   % onPostExecute (Ljava/lang/Void;)V                   E   D   C   C onPreExecute ()V                   L   K   J   I   N   M   I onProgressUpdate ([Ljava/lang/Integer;)V                         S   R      W   V   U   T      Y   R 
dirChecker (Ljava/lang/String;)V                         ^   \      _      a   \ onProgressUpdate ([Ljava/lang/Object;)V    onPostExecute (Ljava/lang/Object;)V    doInBackground '([Ljava/lang/Object;)Ljava/lang/Object;    #com/chmod0/manpages/DownloadZipTask com/chmod0/manpages DownloadZipTask�[o� DownloadZipTask.java    <init> K(Lcom/chmod0/manpages/ManualActivity;Ljava/lang/String;Ljava/lang/String;)V                                      doInBackground #([Ljava/lang/Void;)Ljava/lang/Void;                            %            )   (   &   %   $   #   "      *      +   -   ,      5   0   /      5   2   1      4   3      6    onProgressUpdate ([Ljava/lang/Integer;)V                         <   ;      @   ?   >   =      B   ; onPostExecute (Ljava/lang/Void;)V          	         H   G   F   F onProgressUpdate ([Ljava/lang/Object;)V    onPostExecute (Ljava/lang/Object;)V    doInBackground '([Ljava/lang/Object;)Ljava/lang/Object;    3com/chmod0/manpages/BrowserActivity$MyWebViewClient com/chmod0/manpages BrowserActivity$MyWebViewClient�[���4 BrowserActivity.java    <init> ((Lcom/chmod0/manpages/BrowserActivity;)V                   �   � shouldOverrideUrlLoading -(Landroid/webkit/WebView;Ljava/lang/String;)Z                   
         �   �      �      �   �   �   �   �      �   �   �   � <init> O(Lcom/chmod0/manpages/BrowserActivity;Lcom/chmod0/manpages/BrowserActivity$1;)V                   �   � 7com/chmod0/manpages/EmmaInstrument/InstrumentedActivity "com/chmod0/manpages/EmmaInstrument InstrumentedActivity�#��@�6 InstrumentedActivity.java    <init> ()V                   
      
 setFinishListener 6(Lcom/chmod0/manpages/EmmaInstrument/FinishListener;)V                       finish ()V                         6   5   4      7      9   4 
access$000 n(Lcom/chmod0/manpages/EmmaInstrument/InstrumentedActivity;)Lcom/chmod0/manpages/EmmaInstrument/FinishListener;                   
   
 <clinit> ()V                       com/chmod0/manpages/Page com/chmod0/manpages Page�~�]�&� 	Page.java    <init> (Ljava/lang/String;I)V          	                      getName ()Ljava/lang/String;                       setName (Ljava/lang/String;)V                          
getSection ()I                       
setSection (I)V                   "   !   ! toString ()Ljava/lang/String;                   &   & $com/chmod0/manpages/ManualActivity$1 com/chmod0/manpages ManualActivity$1��z��� ManualActivity.java    <init> '(Lcom/chmod0/manpages/ManualActivity;)V                   H   H onEditorAction 4(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z                   	               M      M      P   O      R      U      Z   M "com/chmod0/manpages/ManualActivity com/chmod0/manpages ManualActivity�K�1ph ManualActivity.java    <init> ()V                   #   # onCreate (Landroid/os/Bundle;)V                9         -   ,   A   =   <   ;   8   7   6   2   0   /      B      H   ^   ]   F   , 	initPages ()Ljava/util/ArrayList;          7      	   o   m   l   k   j   i   h   g   f   f loadPagesNames (II)Ljava/util/ArrayList;                   	               �      }      �      �      �      �   �   �      �   } displayManpage (Lcom/chmod0/manpages/Page;)V                   �   �   �   �   �   �   � getManpageCalled .(Ljava/lang/String;)Lcom/chmod0/manpages/Page;                   	               �      �      �   �      �      �      �   � checkPageFilesOnExternalStorage (Ljava/lang/String;)Z                   	   
                  �      �      �   �      �      �      �   �      �      �   � suggestDownload ()V          -      
   �   �   �   �   �   �   �   �   �   �   � downloadPages ()Z       
      <                  
         
      �   �      �   �      �   �   �      �      �   �      �   �   �      �      �                 
                      � extractZipFile (Ljava/lang/String;)V                          onCreateOptionsMenu (Landroid/view/Menu;)Z                  (  '  ' onOptionsItemSelected (Landroid/view/MenuItem;)Z                              1  0     3  :  9  8  6  5  4     >  =     F  E  C  B  A     I  0 
access$000 ?(Lcom/chmod0/manpages/ManualActivity;)Landroid/app/AlertDialog;                   #   # 
access$100 '(Lcom/chmod0/manpages/ManualActivity;)Z                   #   # Icom/chmod0/manpages/EmmaInstrument/InstrumentedActivity$CoverageCollector "com/chmod0/manpages/EmmaInstrument &InstrumentedActivity$CoverageCollector�ҡ���G InstrumentedActivity.java    <init> <(Lcom/chmod0/manpages/EmmaInstrument/InstrumentedActivity;)V                       	onReceive 4(Landroid/content/Context;Landroid/content/Intent;)V                      	                                        (   '   #   !      (      )      .    $com/chmod0/manpages/ManualActivity$2 com/chmod0/manpages ManualActivity$2ߓd5cK-/ ManualActivity.java    <init> '(Lcom/chmod0/manpages/ManualActivity;)V                   �   � onClick %(Landroid/content/DialogInterface;I)V                         �   �   �      �   �      �   �   �