# Author Tamir Suliman
# data 02 - 9 -2022

# Reading data from logstasy output over TCP 

import json 
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


