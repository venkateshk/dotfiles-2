# installing gems from rubygems over https was creating trouble.
# 
# this fix was found as the first comment on http://railsapps.github.io/openssl-certificate-verify-failed.html
#
# brew install openssl
# brew link openssl --force
# brew install curl-ca-bundle
# cd /usr/local/etc/openssl/certs/
# sudo curl -O  http://curl.haxx.se/ca/cacert.pem
# sudo mv cacert.pem cert.pem
# cd ~
# echo "export SSL_CERT_FILE=/usr/local/etc/openssl/certs/cert.pem" >> ~/.bash_profile
# 
export SSL_CERT_FILE=/usr/local/etc/openssl/certs/cert.pem
