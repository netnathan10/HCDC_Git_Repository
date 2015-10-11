import nmap
from optparse import OptionParser
import time

parser = OptionParser()
parser.add_option("-s", "--hosts", dest="hosts")
parser.add_option("-p", "--ports", dest="ports")
parser.add_option("-i", "--interval", type="int", dest="interval")

(options, args) = parser.parse_args()
# Convert seconds into minutes for time interval
minutes = options.interval * 60

while True:
    nm = nmap.PortScanner()
    nm.scan(options.hosts, options.ports)
    for host in nm.all_hosts():
        print('----------------------------------------------------')
        print('Host : %s (%s)' % (host, nm[host].hostname()))
        print('State : %s' % nm[host].state())
        for proto in nm[host].all_protocols():
            print('----------')
            print('Protocol : %s' % proto)

            lport = nm[host][proto].keys()
            lport.sort()
            for port in lport:
                print ('port : %s\tstate : %s' % (port, nm[host][proto][port]['state']))
    time.sleep(minutes)
