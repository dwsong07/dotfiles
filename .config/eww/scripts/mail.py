#!/bin/python

import sys
import imaplib
import ssl
import warnings

# make mail_address.py file!
import mail_address as ma 

warnings.filterwarnings("ignore", category=DeprecationWarning) 
[imap, email, password] = ma.env(sys.argv[1])

client_context = ssl.SSLContext(ssl.PROTOCOL_TLS)
client_context.set_ciphers("HIGH:!DH:!aNULL")

obj = imaplib.IMAP4_SSL(imap, 993, ssl_context=client_context)
obj.login(email, password)
obj.select()
print(len(obj.search(None, 'UnSeen')[1][0].split()))
