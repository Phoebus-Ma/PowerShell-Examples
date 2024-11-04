###
# TCP client example.
#
# License - MIT.
###

param([string] $remoteHost = "localhost", [int] $port = 65532)

try
{
    Write-Host "Connecting to $remoteHost on port $port ... " -NoNewLine
    try
    {
        $socket = New-Object System.Net.Sockets.TcpClient($remoteHost, $port)
        Write-Host -ForegroundColor Green "OK"
    }
    catch
    {
        Write-Host -ForegroundColor Red "failed"
        exit -1
    }

    $stream   = $socket.GetStream()
    $writer   = New-Object System.IO.StreamWriter( $stream )
    $buffer   = New-Object System.Byte[] 1024
    $encoding = New-Object System.Text.AsciiEncoding

    Write-Output ("Press 'Ctrl + C' to quit.")

    while( $true )
    {
        start-sleep -m 500

        while( $stream.DataAvailable )
        {
            $read = $stream.Read($buffer, 0, 1024)
            Write-Host -n ($encoding.GetString($buffer, 0, $read))
        }

        $command = Read-Host ("Input data: ")
        $writer.WriteLine($command)
        $writer.Flush()
    }
}
finally
{
    if( $writer ) {	$writer.Close() }
    if( $stream ) {	$stream.Close() }
} 
