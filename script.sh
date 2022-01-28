#########################################################
# This script is for dowloading your owm videos
# on youtube if u are using it for other purposes
# it will be on your responsability
#########################################################


download(){


echo "hello download"

urlparser 

newurl=$(<fileurl.txt)

headers="-H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101 Firefox/91.0' 
         -H 'Accept: */*' 
         -H 'Accept-Language: en-US,en;q=0.5'
         --compressed -H 'Origin: https://www.youtube.com'
         -H 'Alt-Used: rr1---sn-hpa7kn7e.googlevideo.com' 
         -H 'Connection: keep-alive' 
         -H 'Referer: https://www.youtube.com/'
         -H 'Sec-Fetch-Dest: empty' 
         -H 'Sec-Fetch-Mode: cors' 
         -H 'Sec-Fetch-Site: cross-site' 
         -H 'TE: trailers'"

completeurl="$newurl"

echo "$completeurl"

curl $completeurl > audio1.webm




}


urlparser(){

#extracting range, first element of the range and second element of the range

firstvideopacketurl="https://rr1---sn-vg5obxu0opn-u0ol.googlevideo.com/videoplayback?expire=1643406706&ei=EhH0Yee7E9SP1gK_863wDw&ip=[YOUR_IP_ADDRESS]&id=o-ACVwt32cUcbvgvOAl9hu0x_JoZ5U14z_yPY7htELUyGP&itag=251&source=youtube&requiressl=yes&mh=H4&mm=31,29&mn=sn-vg5obxu0opn-u0ol,sn-hpa7znz6&ms=au,rdu&mv=m&mvi=1&pl=21&initcwndbps=300000&vprv=1&mime=audio/webm&ns=1SOzhtC_0_DTCJ6_MgencwwG&gir=yes&clen=1075046&dur=85.021&lmt=1610643240135885&mt=1643384744&fvip=1&keepalive=yes&fexp=24001373,24007246&c=WEB&txp=5432434&n=WHKAEPCSC38wpA&sparams=expire,ei,ip,id,itag,source,requiressl,vprv,mime,ns,gir,clen,dur,lmt&sig=AOq0QJ8wRQIgCipskWQnEdISkJdihuRTE6vrZM9FOry2R6HtG31rZyUCIQDSm2FCVx2n9tGH6kjOUN9dNq3kR-BvW4vzY7ayKowfOA==&lsparams=mh,mm,mn,ms,mv,mvi,pl,initcwndbps&lsig=AG3C_xAwRgIhAL98uHe-Db54ZKg4AY4EOx5Vhx2_SQmq23GKkhL-Wt5sAiEAh5dZDn6KzCAfdD7b7jg-UY8voT1ypn3s5pAC47TrpHE=&alr=yes&cpn=3fTC6dXGvWTyU9Vh&cver=2.20220126.11.00&range=197024-262559&rn=12&rbuf=3595"


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

#echo "le nouveau url :::::::::: $nouveauurl"

}

download




