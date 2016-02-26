Here we go!

I decided to go nuts and use encrypted data bags for the mysql password, even though I am not totally familiar with them.  I don't think there's a good way to bundle the databag I used into this repo (as that would sort of defeat the purpose of separating the secrets from the deployment), so I think you'll need to create a secret file, encrypt a databag that contains a "root_password" item, and then update the data_bags_path and encrypted_data_bag_secret_key_path in your .kitchen.yml file.  I hope I haven't created a headache.

Verified that it works for me in Vagrant (edit /etc/hosts to add 192.168.34.34 ['site_url'] and I can browse to a wordpress install page), but haven't pushed out to a remote node.

Give me a call if you run into any problems!

 -M 
