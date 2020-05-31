//치센셜 world//
//Made by Chickiyeah//
import org.bukkit.Bukkit
import org.bukkit.WorldCreator
import org.bukkit.WorldType
import org.bukkit.World
import java.io.File
import org.bukkit.generator.ChunkGenerator
IF $isop || $haspermission:"chissentials.world" || $haspermission:"chissentials.admin"
	IF args.length == 0
		#MESSAGE "&6&l/world <월드> [x] [y] [z]"
		IF $isop || $haspermission:"chissentials.worldloader" || $haspermission:"chissentials.admin"
			#MESSAGE "&6&l/world load &b&l<월드이름(string)> (type)"
			#MESSAGE "&6&l/world unload &b&l<월드이름(string)>"
		ELSE
		ENDIF
	ELSEIF args.length == 1
		IF args[0] == "load"
			#MESSAGE "&6&l월드이름은 공백일 수 없습니다."
			#STOP
		ELSE
		ENDIF
		IF {args[0]+"setworldspawn"} == "true"
			x = {args[0]+"x"}
			y = {args[0]+"y"}
			z = {args[0]+"z"}
			yaw = {args[0]+"yaw"}
			pitch = {args[0]+"pitch"}
			SYNC
			player.teleport(location(args[0], x, y, z, yaw, pitch))
			ENDSYNC
		ELSE
			SYNC
			player.teleport(location(args[0], 12, 64, 81))
			ENDSYNC
		ENDIF
	ELSEIF args.length == 2
		IF $isop || $haspermission:"chissentials.worldloader" || $haspermission:"chissentials.admin"
			size = Bukkit.getServer().getWorlds().size()
			worldlist = list()
			FOR i = 0:size
				world = Bukkit.getServer().getWorlds().get(i).getName().toString()
				worldlist.add(world)
			ENDFOR
			IF args[0] == "load"
				IF args[1] == "null"
					#MESSAGE "&6&l월드이름은 공백일 수 없습니다."
					#STOP
				ELSE
					IF worldlist.contains(args[1])
						#MESSAGE "&6&l이미 로드된 월드입니다. 로드할수 없습니다."
						#STOP
					ELSE
						worldfolder = File("./world/"+args[1])
						IF !worldfolder.exists()
							#MESSAGE "&6&l기존 월드 폴더를 찾을수 없습니다. 월드를 생성합니다."
							creator = WorldCreator(args[1])
							Bukkit.getServer().createWorld(creator)
							world = Bukkit.getWorld(args[1])
							Bukkit.getServer().createMap(world)
							#STOP
						ELSE
							#MESSAGE "&6&l기존 월드 폴더를 확인하였습니다. 로드를 시도합니다. 콘솔을 확인해주세요."
							creator = WorldCreator(args[1])
							Bukkit.getServer().createWorld(creator)
							#STOP
						ENDIF
					ENDIF
				ENDIF
			ELSE
			ENDIF
		ELSE
		ENDIF
		IF $isnumber:args[1]
			SYNC
			player.teleport(location(args[0], parseInt(args[1]), 64, 81))
			ENDSYNC
		ELSE
			#MESSAGE "&6&l치센셜 &f&l: &4&l좌표는 숫자만 입력해야합니다."
		ENDIF
	ELSEIF args.length == 3
		IF $isop || $haspermission:"chissentials.worldloader" || $haspermission:"chissentials.admin"
			IF args[0] == "load"
			worldtype = list()
			FOR c = WorldType.values()
			worldtype.add(c.toString())
			ENDFOR
				IF worldtype.contains(args[2])
					type = WorldType.valueOf(args[2])
					size = Bukkit.getServer().getWorlds().size()
					worldlist = list()
					FOR i = 0:size
						world = Bukkit.getServer().getWorlds().get(i).getName().toString()
						worldlist.add(world)
					ENDFOR
						IF args[1] == "null"
							#MESSAGE "&6&l월드이름은 공백일 수 없습니다."
							#STOP
						ELSE
							IF worldlist.contains(args[1])
								#MESSAGE "&6&l이미 로드된 월드입니다. 로드할수 없습니다."
								#STOP
							ELSE
								worldfolder = File("./world/"+args[1])
								IF !worldfolder.exists()
									#MESSAGE "&6&l기존 월드 폴더를 찾을수 없습니다. 월드를 생성합니다."
									creator = WorldCreator(args[1])
									creator = creator.type(type)
									Bukkit.getServer().createWorld(creator)
									world = Bukkit.getWorld(args[1])
									Bukkit.getServer().createMap(world)
									#STOP
								ELSE
									#MESSAGE "&6&l기존 월드 폴더를 확인하였습니다. 로드를 시도합니다. 콘솔을 확인해주세요."
									creator = WorldCreator(args[1])
									Bukkit.getServer().createWorld(creator)
									#STOP
								ENDIF
							ENDIF
						ENDIF
				ELSE
				#MESSAGE "&6&l월드 타입을 찾을수 없습니다"
				#STOP
				ENDIF
			ELSE
			ENDIF
		ELSE
		ENDIF
		IF $isnumber:args[1] && $isnumber:args[2]
			SYNC
			player.teleport(location(args[0], parseInt(args[1]), parseInt(args[2]), 81))
			ENDSYNC
		ELSE
			#MESSAGE "&6&l치센셜 &f&l: &4&l좌표는 숫자만 입력해야합니다."
		ENDIF
	ELSEIF args.length == 4
		IF $isop || $haspermission:"chissentials.worldloader" || $haspermission:"chissentials.admin"
			IF args[0] == "load"
			worldtype = list()
			FOR c = WorldType.values()
			worldtype.add(c.toString())
			ENDFOR
				IF worldtype.contains(args[2])
					type = WorldType.valueOf(args[2])
					size = Bukkit.getServer().getWorlds().size()
					worldlist = list()
					IF args[2] == "FLAT" || args[2] == "Flat" || args[2] == "flat"
						json = $cmdline:4
						json = json.replace("'", "\"")					
						FOR i = 0:size
							world = Bukkit.getServer().getWorlds().get(i).getName().toString()
							worldlist.add(world)
						ENDFOR
							IF args[1] == "null"
								#MESSAGE "&6&l월드이름은 공백일 수 없습니다."
								#STOP
							ELSE
								IF worldlist.contains(args[1])
									#MESSAGE "&6&l이미 로드된 월드입니다. 로드할수 없습니다."
									#STOP
								ELSE
									worldfolder = File("./world/"+args[1])
									IF !worldfolder.exists()
										#MESSAGE "&6&l기존 월드 폴더를 찾을수 없습니다. 월드를 생성합니다."
										creator = WorldCreator(args[1])
										creator = creator.type(type)
										creator = creator.generatorSettings(json)
										Bukkit.getServer().createWorld(creator)
										world = Bukkit.getWorld(args[1])
										Bukkit.getServer().createMap(world)
										#STOP
									ELSE
										#MESSAGE "&6&l기존 월드 폴더를 확인하였습니다. 로드를 시도합니다. 콘솔을 확인해주세요."
										creator = WorldCreator(args[1])
										Bukkit.getServer().createWorld(creator)
										#STOP
									ENDIF
								ENDIF
							ENDIF
					ELSE
						#MESSAGE "&e&l<generatorSettings> 은 &6&lTYPE 이 &a&lFLAT인 &6&l경우에만 사용이 가능합니다."
						#MESSAGE "&4&l<generatorSettings> 을 무시합니다."
						FOR i = 0:size
							world = Bukkit.getServer().getWorlds().get(i).getName().toString()
							worldlist.add(world)
						ENDFOR
							IF args[1] == "null"
								#MESSAGE "&6&l월드이름은 공백일 수 없습니다."
								#STOP
							ELSE
								IF worldlist.contains(args[1])
									#MESSAGE "&6&l이미 로드된 월드입니다. 로드할수 없습니다."
									#STOP
								ELSE
									worldfolder = File("./world/"+args[1])
									IF !worldfolder.exists()
										#MESSAGE "&6&l기존 월드 폴더를 찾을수 없습니다. 월드를 생성합니다."
										creator = WorldCreator(args[1])
										creator = creator.type(type)
										Bukkit.getServer().createWorld(creator)
										world = Bukkit.getWorld(args[1])
										Bukkit.getServer().createMap(world)
										#STOP
									ELSE
										#MESSAGE "&6&l기존 월드 폴더를 확인하였습니다. 로드를 시도합니다. 콘솔을 확인해주세요."
										creator = WorldCreator(args[1])
										Bukkit.getServer().createWorld(creator)
										#STOP
									ENDIF
								ENDIF
							ENDIF
					ENDIF
				ELSE
					#MESSAGE "&6&l월드 타입을 찾을수 없습니다"
					#STOP
				ENDIF
			ELSE
			ENDIF
		ELSE
		ENDIF
		IF $isnumber:args[1] && $isnumber:args[2] && $isnumber:args[3]
			SYNC
			player.teleport(location(args[0], parseInt(args[1]), parseInt(args[2]), parseInt(args[3])))
			ENDSYNC
		ELSE
			#MESSAGE "&6&l치센셜 &f&l: &4&l좌표는 숫자만 입력해야합니다."
		ENDIF
	ELSEIF args.length == 5
		IF $isnumber:args[1] && $isnumber:args[2] && $isnumber:args[3] && $isnumber:args[4]
			SYNC
			player.teleport(location(args[0], parseInt(args[1]), parseInt(args[2]), parseInt(args[3]), parseInt(args[4])))
			ENDSYNC
		ELSE
			#MESSAGE "&6&l치센셜 &f&l: &4&l좌표는 숫자만 입력해야합니다."
		ENDIF
	ELSEIF args.length == 6
		IF $isnumber:args[1] && $isnumber:args[2] && $isnumber:args[3] && $isnumber:args[4] && $isnumber:args[5]
			SYNC
			player.teleport(location(args[0], parseInt(args[1]), parseInt(args[2]), parseInt(args[3]), parseInt(args[4]), parseInt(args[5])))
			ENDSYNC
		ELSE
			#MESSAGE "&6&l치센셜 &f&l: &4&l좌표는 숫자만 입력해야합니다."
		ENDIF
	ELSE
		IF $isop || $haspermission:"chissentials.worldloader" || $haspermission:"chissentials.admin"
			IF args[0] == "load"
			worldtype = list()
			FOR c = WorldType.values()
			worldtype.add(c.toString())
			ENDFOR
				IF worldtype.contains(args[2])
					type = WorldType.valueOf(args[2])
					size = Bukkit.getServer().getWorlds().size()
					worldlist = list()
					IF args[2] == "FLAT" || args[2] == "Flat" || args[2] == "flat"
						json = $cmdline:4
						json = json.replace("'", "\"")					
						FOR i = 0:size
							world = Bukkit.getServer().getWorlds().get(i).getName().toString()
							worldlist.add(world)
						ENDFOR
							IF args[1] == "null"
								#MESSAGE "&6&l월드이름은 공백일 수 없습니다."
								#STOP
							ELSE
								IF worldlist.contains(args[1])
									#MESSAGE "&6&l이미 로드된 월드입니다. 로드할수 없습니다."
									#STOP
								ELSE
									worldfolder = File("./world/"+args[1])
									IF !worldfolder.exists()
										#MESSAGE "&6&l기존 월드 폴더를 찾을수 없습니다. 월드를 생성합니다."
										creator = WorldCreator(args[1])
										creator = creator.type("FLAT")
										creator = creator.generator("FLAT")
										#MESSAGE creator
										creator = creator.generatorSettings(json)
										#MESSAGE creator.generatorSettings()
										#MESSAGE creator
										#MESSAGE creator.type()
										creator = creator.type("FLAT")
										creator = creator.generatorSettings(json)
										#MESSAGE creator.generatorSettings()
										#MESSAGE creator
										#MESSAGE creator.type()
										Bukkit.getServer().createWorld(creator)
										world = Bukkit.getWorld(args[1])
										Bukkit.getServer().createMap(world)
										#STOP
									ELSE
										#MESSAGE "&6&l기존 월드 폴더를 확인하였습니다. 로드를 시도합니다. 콘솔을 확인해주세요."
										creator = WorldCreator(args[1])
										Bukkit.getServer().createWorld(creator)
										#STOP
									ENDIF
								ENDIF
							ENDIF
					ELSE
						#MESSAGE "&e&l<generatorSettings> 은 &6&lTYPE 이 &a&lFLAT인 &6&l경우에만 사용이 가능합니다."
						#MESSAGE "&4&l<generatorSettings> 을 무시합니다."
						FOR i = 0:size
							world = Bukkit.getServer().getWorlds().get(i).getName().toString()
							worldlist.add(world)
						ENDFOR
							IF args[1] == "null"
								#MESSAGE "&6&l월드이름은 공백일 수 없습니다."
								#STOP
							ELSE
								IF worldlist.contains(args[1])
									#MESSAGE "&6&l이미 로드된 월드입니다. 로드할수 없습니다."
									#STOP
								ELSE
									worldfolder = File("./world/"+args[1])
									IF !worldfolder.exists()
										#MESSAGE "&6&l기존 월드 폴더를 찾을수 없습니다. 월드를 생성합니다."
										creator = WorldCreator(args[1])
										creator = creator.type(type)
										Bukkit.getServer().createWorld(creator)
										world = Bukkit.getWorld(args[1])
										Bukkit.getServer().createMap(world)
										#STOP
									ELSE
										#MESSAGE "&6&l기존 월드 폴더를 확인하였습니다. 로드를 시도합니다. 콘솔을 확인해주세요."
										creator = WorldCreator(args[1])
										Bukkit.getServer().createWorld(creator)
										#STOP
									ENDIF
								ENDIF
							ENDIF
					ENDIF
				ELSE
					#MESSAGE "&6&l월드 타입을 찾을수 없습니다"
					#STOP
				ENDIF
			ELSE
			ENDIF
		ELSE
		ENDIF
	ENDIF
ELSE
#MESSAGE "&6&l치센셜 &f&l: &4&l이 명령어를 실행할 수 있는 권한이 없습니다."
ENDIF