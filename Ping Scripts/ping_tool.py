import subprocess
def systemCommand(Command):
    Output = ""
    Error = ""     
    try:
        Output = subprocess.check_output(Command,stderr = subprocess.STDOUT,shell='True')
    except subprocess.CalledProcessError as e:
        #Invalid command raises this exception
        Error =  e.output 

    if Output:
        Stdout = Output.split("\n")
    else:
        Stdout = []
    if Error:
        Stderr = Error.split("\n")
    else:
        Stderr = []

    return (Stdout,Stderr)

#in main
Host = "0.0.0.0y"  # add the ip ranges here in lists
NoOfPackets = 2
Timeout = 5000 #in milliseconds
#Command for windows
Command = 'ping -n {0} -w {1} {2}'.format(NoOfPackets,Timeout,Host)
#Command for linux 
#Command = 'ping -c {0} -w {1} {2}'.format(NoOfPackets,Timeout,Host)
Stdout,Stderr = systemCommand(Command)
if Stdout:
   print("Host [{}] is reachable.".format(Host))
else:
   print("Host [{}] is unreachable.".format(Host))