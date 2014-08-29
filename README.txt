sh block_replace_v3.sh data.xml data.txt text.txt


keytool -export -alias tomcatsso -file server.cer -keystore server.keystore -storepass changeit

keytool -importkeystore -srckeystore keystore.jks -destkeystore intermediate.p12 -deststoretype PKCS12
openssl pkcs12 -in intermediate.p12 -out extracted.pem -nodes
