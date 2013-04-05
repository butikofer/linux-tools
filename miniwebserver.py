#!/usr/bin/env python
# If necessary, replace above with your path to python

import socket
import SimpleHTTPServer

#addrInfo = socket.gethostbyaddr(socket.gethostbyname(socket.gethostname()))
#ipAddr = addrInfo[2][0]
ipAddr = "10.27.10.207"

print "http://" + ipAddr + ":8000/"
SimpleHTTPServer.test()
