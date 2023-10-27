from decrypt import decrypt
from encrypt import encrypt


def main():
    path_backup = "backup.json"
    path_backup_decrypted = "decrypted_backup.json"
    path_iv = "iv.txt"
    genid = "638318333934100731"
    module_name = "%24edgeAgent"
    ip = "172.21.216.27"

    #dec = decrypt(ip,path_backup, path_iv, genid, module_name)
    enc = encrypt(ip,path_backup_decrypted, path_iv, genid, module_name)

    #print(dec)

    #print(enc)
    print("Done with encryption and decryption")



if __name__ == "__main__":
    main()