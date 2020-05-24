import java.io.File
import org.bukkit.configuration.file.YamlConfiguration
import org.bukkit.Bukkit
	chissentialspath = File("./plugins/TriggerReactor/chissentials")
	configpath = File("./plugins/TriggerReactor/chissentials/config")
	logpath = File("./plugins/TriggerReactor/chissentials/log")
	datepath = File("./plugins/TriggerReactor/Placeholder/realdate.js")

IF !datepath.exists()
	#LOG "[chissentials] 날짜 묘듈을 찾지 못하였습니다 로그파일에 날짜/시간을 표시하지 않습니다"
	#MESSAGE "&6[chissentials] &f날짜 묘듈을 찾지 못하였습니다 로그파일에 날짜/시간을 표시하지 않습니다"
	{"banblock-placelogtime"} = "false"
ELSE
	{"banblock-placelogtime"} = "true"
ENDIF
	
IF !chissentialspath.exists()
	chissentialspath.mkdir()
	#LOG "[chissentials] 트리거 폴더 (./plugins/TriggerReactor/chissentials)을/를 생성중입니다.)"
ELSE
ENDIF

IF !configpath.exists()
	configpath.mkdir()
	#LOG "[chissentials] 트리거 폴더 (./plugins/TriggerReactor/chissentials/config)을/를 생성중입니다.)"
ELSE
ENDIF

IF !logpath.exists()
	logpath.mkdir()
	#LOG "[chissentials] 트리거 폴터 (./plugins/TriggerReactor/chissentials/log)을/를 생성중입니다.)"
ELSE
ENDIF
	logFile = File("./plugins/TriggerReactor/chissentials/log/log-banitem.yml")
	LogYml = YamlConfiguration.loadConfiguration(logFile)
	configFile = File("./plugins/TriggerReactor/chissentials/config/config-banitem.yml")
	configYml = YamlConfiguration.loadConfiguration(configFile)
	
IF !configFile.exists()
#LOG "[chissentials module](banitem) 컨피그 파일을 생성중입니다"
configYml.set("BanBlockList", list())
configYml.save(configFile)
ban = configYml.get("BanBlockList")
ban.add("TNT")
ban.add("ACTIVATOR_RAIL")
ban.add("REDSTONE")
ban.add("REDSTONE_TORCH_ON")
ban.add("REDSTONE_BLOCK")
ban.add("PISTON_STICKY_BASE")
ban.add("PISTON_BASE")
ban.add("DROPPER")
ban.add("DISPENSER")
configYml.save(configFile)
ELSE
ENDIF

IF !logFile.exists()
#LOG "[chissentials module](banitem) 로그 파일을 생성중입니다"
	
	LogYml.set("log", list())
	LogYml.save(logFile)
ELSE
ENDIF

log = LogYml.get("log")
	list = list()
	players = Bukkit.getOnlinePlayers()
	size = Bukkit.getOnlinePlayers().size()
	FOR i = 0:size
		nick = players.get(i)
		list.add(nick.getName())
	ENDFOR

ban = configYml.get("BanBlockList")
type = event.getBlockPlaced().getType().toString()
x = event.getBlockPlaced().getX()
y = event.getBlockPlaced().getY()
z = event.getBlockPlaced().getZ()
builder = event.getPlayer().getName()

IF ban.contains(type.toString())
	#CANCELEVENT
	#MESSAGE "&e&l"+type.toString()+"은/는 &4&l설치가 금지된 아이템입니다"
	log.add($realdate+"금지 아이템 설치 시도알림 : 위치 x = "+x+" y = "+y+" z = "+z+" 설치 시도자 : "+builder+" 아이템 : "+type.toString())
	#LOG $realdate+"금지 아이템 설치 시도알림 : 위치 x = "+x+" y = "+y+" z = "+z+" 설치 시도자 : "+builder+" 아이템 : "+type.toString()
	LogYml.save(logFile)
ELSE
ENDIF

	FOR i = 0:36
	IF player.getInventory().getItem(i) == "null"
	ELSE
	ittype = player.getInventory().getItem(i).getType().toString()
	itamount = player.getInventory().getItem(i).getAmount()
	IF ban.contains(ittype)
	player.getInventory().clear(i)
	#MESSAGE "&4&l"+i+"번 슬롯의 금지 아이템 "+ittype+" "+itamount+"개가 삭제되었습니다"
	log.add($playername+"의 인벤토리 "+i+"번 슬롯의 금지 아이템 "+ittype+" "+itamount+"개가 삭제되었습니다")
	ELSE
	ENDIF
	ENDIF
	ENDFOR
	LogYml.save(logFile)