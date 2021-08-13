# download the dataset
wget -cO - https://cloudstor.aarnet.edu.au/plus/s/11IKe9VtmkdikIN/download > ./data/test/GardensPointWalking.zip
unzip -q ./data/test/GardensPointWalking.zip -d ./data/test/
rm ./data/test/GardensPointWalking.zip
