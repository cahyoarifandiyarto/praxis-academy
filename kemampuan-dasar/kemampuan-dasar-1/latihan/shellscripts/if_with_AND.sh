echo "Masukkan Email Anda"
read username
echo "Masukkan Password Anda"
read password

if [[ ( $username == "admin" && $password == "secret" ) ]]; then
echo "valid user"
else
echo "invalid user"
fi
