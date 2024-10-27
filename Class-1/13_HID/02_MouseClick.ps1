###
# Mouse click example.
#
# License - MIT.
###

<#
    const int MOUSEEVENTF_MOVE       = 0x0001;
    const int MOUSEEVENTF_LEFTDOWN   = 0x0002;
    const int MOUSEEVENTF_LEFTUP     = 0x0004;
    const int MOUSEEVENTF_RIGHTDOWN  = 0x0008;
    const int MOUSEEVENTF_RIGHTUP    = 0x0010;
    const int MOUSEEVENTF_MIDDLEDOWN = 0x0020;
    const int MOUSEEVENTF_MIDDLEUP   = 0x0040;
    const int MOUSEEVENTF_WHEEL      = 0x0080;
    const int MOUSEEVENTF_XDOWN      = 0x0100;
    const int MOUSEEVENTF_XUP        = 0x0200;
    const int MOUSEEVENTF_ABSOLUTE   = 0x8000;
#>

#import mouse_event
Add-Type -MemberDefinition '
[DllImport("user32.dll")]
public static extern void mouse_event(int flags, int dx, int dy, int cButtons, int info);
' -Name U32 -Namespace W;

#left mouse click
[W.U32]::mouse_event(8,  0, 0, 0, 0);
