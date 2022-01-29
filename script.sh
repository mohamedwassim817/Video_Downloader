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

curl $completeurl > /data/audio1.webm




}


urlparser(){

#extracting range, first element of the range and second element of the range

firstvideopacketurl="https://rr1---sn-vg5obxu0opn-u0ol.googlevideo.com/videoplayback?expire=1643478847&ei=3yr1YZ7oN6KC1gL0572oDA&ip=196.235.49.87&id=o-AOWvxV6jW1NqqlTRBy3kJ_YjDhy7BL3n2r9_ZOlq7omc&itag=251&source=youtube&requiressl=yes&mh=H4&mm=31%2C29&mn=sn-vg5obxu0opn-u0ol%2Csn-hpa7znz6&ms=au%2Crdu&mv=m&mvi=1&pl=21&initcwndbps=321250&vprv=1&mime=audio%2Fwebm&ns=S0xqnEn_hvINj842rrJ50GoG&gir=yes&clen=1075046&dur=85.021&lmt=1610643240135885&mt=1643456933&fvip=1&keepalive=yes&fexp=24001373%2C24007246&c=WEB&txp=5432434&n=ClgIIpmoQgWGTg&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cns%2Cgir%2Cclen%2Cdur%2Clmt&sig=AOq0QJ8wRgIhAIqCqoy52GKsEFqfxRiJO1H5Me3S70MinT44U2pWKZcKAiEA7RTBFpYcw8eudfIbIyDuR9TUSWOXVV9dvf1vh9IbRRc%3D&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRgIhAJIZAG7P5WXhcDBQLhQXS81xPHbW3cCGIVC3AueedV0AAiEAlka1Iirc7_5_EijXHPMvEtho_G_ho5vNrb45W7Muj08%3D&alr=yes&cpn=664lU7_7jL1gz4DS&cver=2.20220127.09.00&range=197024-262559&rn=11&rbuf=4702"

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




