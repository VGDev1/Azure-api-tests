import requests
import base64
import json
def encrypt(ipaddr, path_backup, path_iv, genid, module_name):

    backup_string = ""
    iv_string = ""
    with open(path_backup, 'r') as myfile:
        backup_string = myfile.read()
    with open(path_iv, 'r') as myfile:
        iv_string = myfile.read()

    genid = "638318333934100731"
    module_name = "%24edgeAgent"
    ip = f"{ipaddr}:8080"
    decrypt_url = f"/modules/{module_name}/genid/{genid}/encrypt?api-version=2022-08-03"
    base_url = f"http://{ip}{decrypt_url}"
    ba_iv = base64.b64encode(iv_string.encode())
    backup_string = base64.b64encode(backup_string.encode())

    request_body = {
        "plaintext": backup_string.decode(),
        "initializationVector": ba_iv.decode()
    }
    #print(base_url)
    #make json string from request body
    json_request_body = json.dumps(request_body)
    #print(json_request_body)
    response = requests.post(base_url, json=request_body)
    base64_cipher = response.json()["ciphertext"].encode()

    with open("encrypted_backup.json", "wb") as myfile:
        myfile.write(base64_cipher)

    return f"""decoded ciphertext outputted to encrypted_backup.json:
        {base64_cipher}"""