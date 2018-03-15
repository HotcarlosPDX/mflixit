$website = "http://www.livenewson.com/american/msnbc.html"
invoke-webrequest $website -UseBasicParsing -OutFile c:/Liveon/HTMLoutput.txt
$wholeline = sls .m3u8 c:/liveon/HTMLoutput.txt
$targeturl = $wholeline.Split('"')[1]
$jsonlocation = "C:\Users\Hotca\AppData\Roaming\Emby-Server\programdata\metadata\channels\00e6b1ff67d0cfb65ba8825631fe1b94\24ba6843a743dc75b647a3d366914cc4\channelmediasourceinfos.json"
$ChannelID = '"e9a19bd2238a2c116249f88b697e7f49","Path":"http://www.livenewson.com/american/msnbc.html"'
$NewchannelID = "e9a19bd2238a2c116249f88b697e7f49","Path":"'$Targeturl'"
(Get-Content $jsonlocation).replace('$ChannelID', '$NewchannelID') | Set-Content $jsonlocation
