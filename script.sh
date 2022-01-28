#########################################################
# This script is for dowloading your owm videos
# on youtube if u are using it for other purposes
# it will be on your responsability
#########################################################


download(){


echo "hello download"

}


urlparser(){

#extracting range, first element of the range and second element of the range

firstvideopacketurl="https://rr3---sn-vg5obxu0opn-u0ol.googlevideo.com/videoplayback?expire=1643389466&ei=us3zYd-OFcrr1gK1yrfQDg&ip=[YOUR_IP_ADDRESS]&id=o-AGu5Bkuv6H1yIPzrFx47YUSFDvh9pd3QbyTaLcvTbm3F&itag=244&aitags=133%2C134%2C135%2C136%2C160%2C242%2C243%2C244%2C247%2C278%2C298%2C299%2C302%2C303&source=youtube&requiressl=yes&mh=4d&mm=31%2C29&mn=sn-vg5obxu0opn-u0ol%2Csn-hpa7kn7l&ms=au%2Crdu&mv=m&mvi=3&pl=21&initcwndbps=315000&spc=4ocVC8QNrNGU7l92d0SWd_xzx5r9&vprv=1&mime=video%2Fwebm&ns=Zcmso9RLRPNwenWVZtg2l9EG&gir=yes&clen=55228321&dur=1073.367&lmt=1638749812310699&mt=1643367683&fvip=3&keepalive=yes&fexp=24001373%2C24007246&c=WEB&txp=5535432&n=eup3w8yovkOAFA&sparams=expire%2Cei%2Cip%2Cid%2Caitags%2Csource%2Crequiressl%2Cspc%2Cvprv%2Cmime%2Cns%2Cgir%2Cclen%2Cdur%2Clmt&sig=AOq0QJ8wRAIgbXAgLxKE_MmIfxAq_2B2av3X-M6wWJcUF6YYv-sokTECIFSteGi1UQmCf-G7q8kn_HhQa85AtYq9rrtH6cblLt4w&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRQIhAIIYw6PKBBeArI4tJtyXxHYdmYLRZTyUWzQLeS5D3Ut6AiANovx0mG_g_KUSmwaaE3-XQquyOo0vB6g28CrOWE8xoA%3D%3D&alr=yes&cpn=X6f8jXVgb6-XeSMI&cver=2.20220126.11.00&range=0-5186021&rn=24&rbuf=85248&pot=GpsBCm4QZM2LRDg-U3xC3wn3dnl2ZmPxGAI6bc384ll2Idj6orQOh2pMJAlPrIyja1Lz_oMzF9ueKux5-N6fTmwLG4sEvzDkwF-iT51J_3TQu5MMfMNYZcGAkfcnx0iWU9FToaKCSCIHQB7Yk60KdYVk-xIpATwYQQ7qYGQ3CUsG3oqtsfWJ0fKm2ONByzwyafvGekDowjwLVujW_x8=' "


fileurl=$( echo "$firstvideopacketurl" > fileurl.txt)

#url param human readable
urlparams=$( echo "$firstvideopacketurl" | xargs -d '&' | xargs -n1)

echo "$urlparams" > fileargs.txt
 
#range param
range=$( grep range fileargs.txt | awk '{print $1}')

echo "$range" > filerange.txt 


firstelementinrange=$(cat filerange.txt | xargs -d "-" | awk '{print $1}')

secondelementinrange=$(cat filerange.txt | xargs -d "-" | awk '{print $2}')


echo "le range est $range"

echo "le first element in range est $firstelementinrange"

echo "le second element in range est $secondelementinrange"


#changing the default range in the file

updatedfirstelementinrange="range=0"

updatedsecondelementinrange=6$secondelementinrange

echo "le updated second element in range est $updatedsecondelementinrange"

echo "$updatedfirstelementinrange-$updatedsecondelementinrange" > fileupdatedrange.txt

rangeinupdatedfile=$( grep range fileupdatedrange.txt | awk '{print $1}')


echo "le range updated est $rangeinupdatedfile"

echo "$range/$rangeinupdatedfile"

sed -i "s/$range/$rangeinupdatedfile/g" fileurl.txt 

nouveauurl=$(<fileurl.txt)

echo "le nouveau url :::::::::: $nouveauurl"

}

download

urlparser


