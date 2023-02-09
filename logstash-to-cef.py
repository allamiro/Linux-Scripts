# Author Tamir Suliman
# data 02 - 9 -2022
# Import libraries 
import json 
import socket 
import os 

# Reading data from logstash output over TCP 

def receive_logs_over_syslog(port):
    # Create a TCP/IP socket
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    # Bind the socket to a specific address and port
    server_address = ('localhost', port)
    print(f"starting up on {server_address}")
    server_socket.bind(server_address)
    # Listen for incoming connections
    server_socket.listen(1)
    while True:
        # Wait for a connection
        print("waiting for a connection")
        client_socket, client_address = server_socket.accept()
        print(f"connection from {client_address}")
        # Receive the incoming data
        data = client_socket.recv(4096)
        # If there's no data, the connection is likely closed
        if not data:
            print("no data from client")
            client_socket.close()
            break
        # Print the incoming data
        print(f"received data: {data.decode()}")

        # Send a response back to the client
        client_socket.sendall(b"ACK")

    # Clean up the server socket
    server_socket.close()



def json_to_cef(message):
   The CEF header and extension fields
    header = 'CEF:0|json-to-cef|json-to-cef|1.0|'
    extension = ''
    # Iterate over the keys and values in the JSON object
    for key, value in json_obj.items():
        # Add the key and value to the extension fields, separated by an equal sign
        extension += f'{key}={value} '
    # Return the complete CEF string
    return header + extension.strip()
if __name__ == '__main__':
    # An example JSON object
    json_obj = {
        'host': 'localhost',
        'severity': 'critical',
        'message': 'An error has occurred',
    }
    # Convert the JSON object to CEF format
    cef_format = json_to_cef(json_obj)
    print(cef_format)


if __name__ == '__main__':
   
