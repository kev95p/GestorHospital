-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital
-- ------------------------------------------------------
-- Server version	5.7.18-log

use hospital;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `citas`
--

LOCK TABLES `citas` WRITE;
/*!40000 ALTER TABLE `citas` DISABLE KEYS */;
/*!40000 ALTER TABLE `citas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `consultas`
--

LOCK TABLES `consultas` WRITE;
/*!40000 ALTER TABLE `consultas` DISABLE KEYS */;
/*!40000 ALTER TABLE `consultas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'Ahuachapan'),(2,'Sonsonate'),(3,'Santa Ana'),(4,'La Libertad'),(5,'Chalatenango'),(6,'San Salvador'),(7,'Cuscatlan'),(8,'La Paz'),(9,'San Vicente'),(10,'Usulutan'),(11,'San Miguel'),(12,'Morazan'),(13,'La Union'),(14,'CabaÃ±as');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `diagnosticos`
--

LOCK TABLES `diagnosticos` WRITE;
/*!40000 ALTER TABLE `diagnosticos` DISABLE KEYS */;
/*!40000 ALTER TABLE `diagnosticos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (4,'juan ','alan','perez','nada','2017-05-18 15:47:09',12,'col alguna','232','wewew','23232'),(9,'Kevin','Geovanni','Pleitez','Geovanni','2017-05-22 11:46:09',1,'col Santa Marta','12345678-9','pleitez@gmail','12345');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `enfemedades`
--

LOCK TABLES `enfemedades` WRITE;
/*!40000 ALTER TABLE `enfemedades` DISABLE KEYS */;
INSERT INTO `enfemedades` VALUES (1,'Anemia','Congenita'),(2,'Asma','Neurodegenerativa'),(3,'Cancer','Hereditaria'),(4,'Colera','Infecciosa'),(5,'Depresion','Mental'),(6,'Dengue','Infecciosa'),(7,'Chikungunya','Infecciosa'),(8,'Demencia','Mental'),(9,'Ebola','Infecciosa'),(10,'Eyaculacion Precoz','Mental'),(11,'Gastritis','Metabolica'),(12,'Neumonia','Infecciosa'),(13,'Rabia','Infecciosa'),(14,'Osteoporosis','Neurodegenerativa'),(15,'SIDA','Infecciosa'),(16,'Sindromo x Fragil','Congenita'),(17,'Sindromo Down','Congenita'),(18,'Vertigo','Mental');
/*!40000 ALTER TABLE `enfemedades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `especialidad_medico`
--

LOCK TABLES `especialidad_medico` WRITE;
/*!40000 ALTER TABLE `especialidad_medico` DISABLE KEYS */;
/*!40000 ALTER TABLE `especialidad_medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `especialidades`
--

LOCK TABLES `especialidades` WRITE;
/*!40000 ALTER TABLE `especialidades` DISABLE KEYS */;
INSERT INTO `especialidades` VALUES (1,'Anatomia Patologica'),(2,'Alergeologia'),(3,'Cardiologia'),(4,'Cirugia Cardiaca'),(5,'Cirugia General'),(6,'Cirugia Plastica'),(7,'Cirugia de mama'),(8,'Cirugia Vascular'),(9,'Dermatologia'),(10,'Endocronologia'),(11,'Gastroenterologia'),(12,'Genetica'),(13,'Geriatria'),(14,'Ginecologia'),(15,'Hematologia'),(16,'Medicina Interna'),(17,'Nefrologia'),(18,'Neumologia'),(19,'Neurocirugia'),(20,'Oftalmologia'),(21,'Otorrinolaringologia'),(22,'Oncologia'),(23,'Pedriatria'),(24,'Proctologia'),(25,'Psiquiatria'),(26,'Reumatologia'),(27,'Traumatologia'),(28,'Urologia');
/*!40000 ALTER TABLE `especialidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `imagenes_perfiles`
--

LOCK TABLES `imagenes_perfiles` WRITE;
/*!40000 ALTER TABLE `imagenes_perfiles` DISABLE KEYS */;
INSERT INTO `imagenes_perfiles` VALUES (1,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0ôx\Ôú\0\0\0sBIT|dˆ\0\0\0	pHYs\0\0\Ä\0\0\Ä•+\0\0\0tEXtSoftware\0Adobe ImageReadyq\Ée<\0\0 \0IDATxœ\í\İKs]\×y&\àom@²K\ê‰Ke9+\İ\ã@ƒ$ƒn\Å\åD\0)²“‘À_@²’SwR$\á‘\ÉÀ\îD6E\Å»{’ô@È°\ËNJœ¤riò%–(`=\0)“/\0y°\×>g?O«Dß’m\î÷|k­½\"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 ¦R;\0\ĞO/^Û™k÷b\æö_k¦c÷µgØ¬•	\0\ä«\×vf÷öb6šf!\"¢D\ÌGDd\ÆL)1÷0\ß33¶K‰íˆˆŒÜŒ(\ïd–Í’û»\ß|ö‰\Ñ$FM€	ôâµ¹ıı©\ÙRr®DşJD™‰ˆ…*a2v£\ÄfF\\\Ï,›M\íoş\é3OlW\É|@€1÷\Õk;³\ï\ïOÍ•\ÒÎ—(sQ\ëA»Qr#²\\/S\í†e\è\0cfñ\Ú\Î\Ì\ãû\ÍR[r>²,”³µ3=²Œ\İ,¹\Ù\\ŞŸ\Úß¸ü\Ì»µ#Á¤S\0`¼xmg®m\ËK7øµV?^r½d¹|cª]W\àx(\0\ĞSÏ¿ùÃ¥R\ÚÅ’e)Ê»ñ\ã\æd \Úüš\r…0Z\n\0ôˆ‡ş½e\Æv‰¸øşT»j*\0N€Ê¾zmgv¯-§\"\Ë\ÒD¬\ç·ƒ©À\êt“&€‡§\0@%/¾ù\ÎJ–x)\Æa\×~Oe\ä\êt“\ç8:\0:t\ë\Ó~É²b\Ä?:Š\0\0x\á\ê\ÎBiÊ©ˆ²T;\Ë\Ä\Ê\Ø\Í÷šö‚=ğ`\n\0£\ç\ßü\áRSòTów\'c·Dœy\í7?¹Z;\nô™\0\Ç\à\Å7\ßYi#\Î\Ú\ÔW\Õ\ÆTÓ´,\0w§\0Àyğ÷OFœû\æ>ùr\í\Ğ7\n\0ŒÀÁ\Zs6Œú{)36§§\Úe\Ó\0ø\0ÁW¯\í\Ì\î·Í¥ğ\à\ï?{\à\n\0<„\Åk;3\Óm9QN\×\Î\ÂQ\å\ê^“gœ`\è\08¢\ç\ß|g¥Dœw|e\Æ\æ\ÔT{\Ò5\Ä™\0‡´xmgvj¿\\*\Æı“!c7\"—]2\ÄP5µÀ8x\á\ê\Î\Ë\Óûe\Ë\Ã‚”˜‰R®=ÿ\æ\ÎJ\í(Pƒ	\0\ÜÇ‹Wv\æö§Ê¥1W;\Ç(\ã\Â7Ÿ9S;tI€{X~s\çt\å|\ít$cõ›\ÏÎœ¬º¢\0À‡,^Û™™\Ú/k\Æı¤0 ö\0Àmsgiz\ÏZÿ`•Xy\á\ê\î¥\Ú1 \n\0\Üô\ÂÕ—K”5\ÇûN	` ,0xFşÜ•\å\0&œÀ ½xeg®m\ÊZ¸¼‡»Q˜`–\0¬\ç\ß\ÜYj›r\ÍÃŸ{*±ò\ÂÕ—kÇ€\ã`À =ÿ\æ\ÎJ‰b—C\ÉÈ“ö›O¬\Ö\Î£¤\008/\\\İ=%\\\âÃ‘4ûùôk_tw\0“C`P^¸º{)J¬\Ô\ÎÁ\Ê\Øİ›\ÎndR\ØÀ`xøóHJ\ÌL\í—kµcÀ¨˜\00ñóc¤\ÜÀ„P\0˜h7ş\×\\\æ\Ã(e\äòŸı\æ\ëµsÀ£P\0˜h\Ëo\î^óÉŸ‘\Ë\Øİ·€1g\0kù\ê.yøs,J\Ì4\ï\çZ\íğ(L\0˜Hÿ²R;“-3Î¬ı\Öjç€‡¡\00q<ü\éL\æ\îş~yúò—Ø®\Ê\0\åù+;+şt¦”™f*½Q’±dÀ\ÄxşÍ¥È°.K÷J8À\ØQ\0˜‹Wv\æ¦J^‹Rfjga€2w÷+N0V,0ö¯\í\ÌL5¹\æ\áO5¥\ÌL\í\å\Ù\Ú1\à(\0\Æ\ŞÁq¬2[9ƒWN/~kg¶v\n8,€±¶|u\ç\åR\ÊB\íaC \ã\Ä\0\Æ\ÖWw2\Â\å,ôJ‰x\æ›\Ï>±Q;<ˆ	\0ciñ\Ú\ÎL¦7±\Ñ?m\ÚÀxP\0K\Íû6ı\ÑO¥”…\ç\ß\ÜYªD`\ì,¿±sÚº?½–y¾vx{\0+‹\ßÚ™šÊ·|ú§÷¼ˆ3`¬4Sy\ÉÃŸqmª\îG`lı3NJ)/\\\İY¨\îeºv\08Œ\Åk;3ñ~M«VŒ‘<8°Q;Ü	\0c¡\Ù\ËóFÿŒR¼¾R\0\è½Å«;\áŠ_\ÆT3\í½\0ô“@\ï5\áHc,ciñÚ\é½c\0½¶xeg%2\ç\"²vxX3\Íû±jÛ™\0\Ğ[‹\×vfš\Ò\ZŸ2ZG\é€\Şjn´§]ó\Ëd(³‹\Ò3\n\0½ts\ÍÔ§&&F“\íKµ3À\í\0z©¹Ñvì‰b3 =£\0\Ğ;>ı3‘J™‰\á–@zC w|úgR5¥]¬nñ^Uzeñ\Ú\ÎLs£\İR\0˜T\íc\å‰\Ë\Ï<±[;˜\0\Ğ/7b\ÉÃŸ‰f€P\0\è\çş™t–\èK\0ô\Æ\â·w–š&\×j\ç€\ãf€>0 7š\Æ9i\Â2\0= \0\ĞW¦)2Mi\çkg\0€^hšv¥v\èLš\0PŸ=\0ô\Â\Òÿo\Ë{ÿ’\Ìòô\å/>±Y;\Ãe@u‹\ß\ŞYòğgxZS\0ªR\0¨®4E1<¥„ÿ\İS•%\0ªZ¼¶3S¼ùJ\Ç©\È€º¼ù!{/jG`¸¦k`\ØJ´‹‘µS@¥\ä|D¬\×\ÎÁ0™\0P›PW\æB\í—@5‹\ßşW†­”¹\Ú.€jJ4vA3x‹\ßú×…\Ú&€Š\Ò\0šf¡v†I Š\Å+;svÿCD‰ø•\Ú&€:r¡v\è©D ŠRŠõˆˆ(e\æ\à6L\è–@-µ@o”=§\èœ@\ç\ìz†)@\ç\0ºg\×3\ÜÁF@jP\0\è\\‰˜¯ú%M\0èœ»\0\è\\›9WŠ‹(\ág\Êl\å\0	\0Z¼²3Wœÿ‡°7†®)\0tlß¨\î¦)³µ#0,\n\0\Ê(6;Á]•\Ù\Ê€®™\0À]¤Í±tL [m«\0Àİ´ior\n€\Î,^Û™‰÷ög\"³v\èRL\Ç\è–	\0\İy\×\ëN\á~\Ü	@—\0ºSŠ\0÷µ7[;Ã¡\0Ğ™\Ìül\í\Ğoe¶r\0D ;&\0ğ\09[;Ã¡\0Ğ»œ\á>²„)Q\0\èŒ]\Îğ e¶r\0D ‹\×v|ú‡1%£C\n\0\İpÈ”Œ.)\0\00@\n\0h#2\"üğÃûÿX¼òÏ¦\0tB\0è“¶±€N(\0t¢D|²v\0~F \é%@p(m\ÄB\íƒ\0\0¤\0\0À\0)\0t#\Ó\0B‰ò+µ30\n\0(¥\Ø\Ù‡\Å\Û\0\é†\0\04];\0‘Y;Œÿ_¡#&\0\0½Rf+` \0€)%fkg`\0\İ\â·şi¶v\0\î¤\0Ğ\é\Ù\Ú	\0¸“\0\0¤\0\0À\0)\0\0=c\ß]P\0\0zÇ¾Ÿq\ìöBÓ„£Ø¯€Ağ÷2\0\0\0¤\0\0À\0)\0\00@\n\0\0À±\Ëıv·v\0\î¤\0p\ì^\îS›µ3\0p\'\0\0H\0€ò&@º‘Y;ŒRj\'`\0L\0\0`€\0\0 €®8	\0\Ğ#\n\0\İ\Èô.\0€Q\0\0`€\0€™~wÚ’\Ç\Î1@:‘{\0j\ç€qpyù	Kf;\0:‘\ï\Ô\Î\0À\Ï(\0\00@\n\0\İ(\ÅH G\0ºQŠMM\0=¢\0\0ô‹²L\'\0:\áX’—f\Ñ€N8\Ö\Ğ/\n\0\Éğ\É /\0:S\Ò\Ú&<HFÙ®aP\0\0z%ß®€ağ*`:“\×K\æB\í\0˜\0\0ôKk¯\İP\0\èN\ÛnÔ\0ı—ö\Ê\Ğ	\0\0H 3ñ\å\'7jg€¾›\í\Ú€Ny\0\Ü\ß\å/=¹];Ã \0Ğ©.\è\Ç\0\éT±Y\"j\ç€>Êˆ\Ú\0:U\"Ş©\0€®9\n÷c‰Œ\Î(\0tj\Ïg¸\'2º¤\0Ğ©+_zr\ÛI\0¸»L™\î(\0T\à$\0\ÜM\Év»v†C \0\î\Â]R\0\è^\Æ\ßÔ\0}t\ÅK€\è@\r&\0ğ.¢[\n\0{ı¹Où‹>$£\ØK§\0ªğ\Æ3¸S‰¸^;Ã¢\0P‹)\0Ü®u<–n¹€:²ı›ˆR;ôˆ=\0t\Ë€*ö§,À\í¦÷>®\0\Ğ)Á¨\æ·ÿüŸvJ”™\Ú9 ¶Œ\Ü}ı¹\'Ÿ¨ƒa1 ¦\Ú ¼“\î)\0TS²\ØõaıŸ\Zl¤š,e#\"kÇ€>ğvL:g@5¯?÷©M7BDq (\0TU\ì€ø‹/?¹Q;Ã£\0P•}\0]¦õ\êP\0¨\ê`\0™\0Ô¡\0P\Õ\ë\Ï}j3¬2`\r€T¢\0P‹2S0jQ\0¨/\ãr\íP‹ë±©E º\Ç÷?¶Q;\Ô`úEM\n\0\Õ]^~b7\"\×k\ç€\Îe:C5\n\0½\à8 ƒ”N\0P@/\ìM›\00<–¿¨\ÉuÀôÆ—şû?½UJ\Ì\Õ\Î]ÈŒ\Íoı\î“O\×\ÎÁp™\0\ĞMi¿V;th£v\0†M 7öö\Z\Ë\0Hk\ßU)\0ôÆ•\å\'·3Ã¦(\áñıµ30lÓµÀí²´_‹h\ì`²en\\^>\á*lª2 W\Ò2\0CP{¥>€^±À”²¯\èR@\ïd\Æ\Å\Ú\à¸d\Ä\î\ë\Ï=¥\äR@\ï|¼}×§#&Vñ\ÚkzB w6G\åj\íp\Ú\Öú?ı \0\ĞO™®f\"™p\Ñ^Lo}\éü\ãVD™­F&#Ö¿ı\å\'—k\ç€\0z­x50%\Û0Ù¢7\0z«İ‹\Õ\Ú`¤Z\ïÿ§?\0z\ë\Êò“\Ûa½”‰›W–ŸÜ®nQ\0\èµ\ï`B¸í’Q\0\èµ+_~r#\"·k\ç€Gõ±½«µ3À\í\0z¯mË¹\Ú\àQdÄº\Ë\è€\Şûxû\îzFøË“±e÷?}¤\0\Ğ{——O\ì{S±\ë\å?ô\Ñt\í\0p\ï½{\á\Æ\Ô\Ç\Î\Ö\ÎGU\"ÿ\é%\0\Æ\Â\å\å»¹š\á‡\ãô£-\İÿô’À\Ø\Èı\Æf@\ÆLnœdşQ\0/QqK c$\í]¡¿\0ÆŠ)\0\ã\äc\í\Õ\Ú\à^\0ÆŠ)\0\ã#Wmş£\Ï\0Æ)\0\ã mş£\ç\0Æ)\0}—›6ÿ\Ñw\n\0c\É€~+6ÿ\Ñ{\n\0c\é\æUÁjç€\Ê\í+‹O®\ÖN¢\00¶>¾ÿŞ¹tG\0=“\Öş\n\0c\ëòò‰\İ\È4j¥72b÷\ã\í\r“)Æ‚ÀX»²ø\é—#r»vˆˆˆÌ‹ş1.\0\Æ^‰8S;øôÏ¸Q\0{\ßú\İO¯G\æF\íœOÿŒ€‰\ĞL¥)\0\Õøô\Ï8R\0˜¯?÷Ô¦cT\ã\Ó?cH`b8H\r>ı3®\0&\Æ\å\å»M\ä\É\Ú9ŸşS¥v\0µßºü\×J\ÄB\í\Â\î»\í\×\0Æ	\0§´\ÍÉ°@\'òŒ‡?\ãJ`\âÜ¼\'ÀeA·\Í+‹O­\ÖK`\"½±ø\é±Q;¬m=e¬)\0L,K›\Ìõ+ËŸÙ¨…ÀÄ²À1ÙœòéŸ±§\00\Ñ\ŞXüô…\È\\¯ƒÉ‘\ç®,?¹];<*€‰÷n¾o)€Q\Ù|cñ\Ó^ú\ÃDP\0˜x×—O\ìF\Û.\×\ÎÁøk[/šbr(\0\Â\Í\r[öğ(\Î]]~j³vodP¼%‡´yeñ\ÓO\×£dÀ ¼\×\ŞXû8\"£&‘À \\_>±Û¶ùL\íŒŒ8cô\Ï$R\0œ«\ËOmf„s\Ü<PFl\ØõÏ¤R\0¤7?}!3Vk\ç \×vo.ÁD²	Aû\â\åx+\"\æj\ç \Ú6Ÿ6úg’™\00h\ï¶7\É\È\í\Ú9\è\ëş	\0ƒ÷\ì\Ú÷\çJ‰k1S;}«o,}Æ®&\0ñA	x«vj\Ë\Í7–>\ã¼?ƒ`	\0\â\æÉ€Ÿú-7\ß\Ë=GD\0¸Í³k\ß_)%.\Õ\ÎA\çv3\ã\ëş‰	\0\Ü\æ\êòS«™\éÎ€añğgL\0\à.~kı\ï/E”•\Ú98vş–\0÷ L<M€ûP&–‡?ƒg\0\Ü\ÇÁyğ\\­ƒ\Ñ*™\Ëş\0 L–\Ì<weù3µs@m–\0\à±qu\é)gı!L\0\à\ĞzY\Ğ\Ûmr\Êp“\0Gpuù©\ÕÈ²»µ³pD™\ç®,?¹];ô…%\0xÏ®}.J®•(³•£pFÿğQ&\0ğ®.?µy#÷Îˆ\ÚYx0£ø(\0xD\Ş\Ğoq\á\ê\ÒSgjç€¾1€Gtó\îx{úi÷F¾\ïn¸\0F\"\×k\'\à£2ó\âõ\å\Ê\Ü\Åt\í\00²¹œ%Wj\Ç\à»7b\ïB\í\ĞW&\00o,z=,ô‹Oÿp_&\00\"\Ù\æF)±T;‘±{£øô÷c\0£R\âz\íÜ’«>ı\Ãı)\00\"%\ÊF\íh\Êş\Å\Ú \ï¼\0F\èÙµ¿\Ï\Ú†.37\ß|ş—®ú\Î\0F)s£v„¡+%}ú‡CP\0`„2Šu\ç\ÊnD\ëp\n\0ŒP)ñ7µ3Yfn\Úü‡£\0\0£”r¹v\n\0ŒP\ëvÀªüû‡\ÃS\0€‰ñ—ËŸÙ¨Æ…\0L„\ÌÜ¬Æ‰\0L„\â.8\0F¨D\Ì\Õ\Î0X¥x3\0#T\"fjg\08\0F(3>[;Àa¸F*g\ÓU¸„\Æ\0F©”…\Ú\0C€yv\íû6\0cC€\ÉÈ…\Ú-ó“µ#À8±\0F$\Ûö¥R¬ÿ\×R2M`\àL\0`¾¸¶5[Jñ\0ªÊ¿8\n\0F`¯mVjg¼3_\\Ûš­Æ…\0#P¢œªˆ6š…\Ê`l(\0ğˆ]{{%Š7\0öA¶±X;Œ;–\àÌ¯m\Í<\ÖNm)\0ı1UöO\\Y>±];ô	\0<‚\é¶9\í\á\ß/öcÀ\á˜\0ÀCzv\íûs™\í[µsğ!»\ï7û\'®/Ÿp=0Ü‡	\0<„ùµ­™¶İ¿T;wQbfºmN×}§\0ÀC˜n§\Î;÷\ß_¥”³\Âı)\0pDÏ®½½RJ¬\Ô\ÎÁıí·	\rÜ‡\0Gğ\ì\Ú\Û+™Åƒe”²ğ…o¾ır\í\ĞW6\Â!}~\í\í•\â\á?v²\Äòw–i½v\è\0`~mkf:§\ÎF„e\ã(c·išg®.?µY;\nô‰\0÷ğ\ì\Ú÷\çÚ¶=\ÖûÇŸ\0¡\0À‡|~\í\í•h\ã”]şF	€;(\0ók[³\Óm³QNy³\ß\ËØ¦,ÿ\åòg6jG\Ú\0\í¯m-DS^Š\âõ±C’™g¾ó\Âg/\Ô\Î5)\0\Îü\Ú\Ö\Ì\Ô~³§J	cşÁ\Êõ½&Oze0C¥\00ók[³\Óû\åTDq}/2¶#Û“ùâ‰\ÚQ k\n\0\ïó\ßø»¥RÚ—\"\ÊR\í,ôTæ…½©<g\ZÀ(\0L¤ùµ­™©¶Y)§¢\Äl\í<ŒŒ\íŒ8÷\ßû\ìj\í(\Ğ€‰ò\ì\Ú\Ö\\Û–S‘eÉ˜Ÿ‡‘¥m\ÏY`\Ò)\0L„\Ï\ã\í•(ñR‰X¨…É 0\é\0\Æ\Ög÷\Æü>\ís,&•ÀØ¹yvÿ”M}t)36#\â¢=L\n€±p\ë\ì~‰8kSUe\ìF\ä\ê\ŞT^¼¾|b»vxX\n\0½fS}vk*°?Õ®;BÈ¸Q\0\è%›ú?¹Y.+Œ€Ş°©I‘qy¿i\×-\ĞW\n\0\Õ}áµ­…¶)§ŠM}L¢Œ\íŒ\\/\Ñ\\ÿ\Î\ïı\Òz\í8p‹@·\Ş\Ô\Ş\Ô\ÇÀd\ÄF9˜l\\_>±Y;Ã¥\0Ğ©ùµ­¹¦-§ŠM}p0(¹Q²¹¼?µ¿a\ï\0]R\0\è\Ä\ç¿ñöJDœ\n\×\ï\Â=\İ6°w€c§\0pl\æ×¶f›ırª¸~\Î\Ş™À\È}ş·”¥}É¦>Œ\\/\Ç7L€‘˜_Ûši\Ú\æt\ÉxÉ¦>8f›Y\âr»ß®_ÿŠ„<€Gò…×¶\Ú(/•+µ³À elg\ÄF)yù;¿w\ÂR‡¦\0pd\ïå¥ˆr*Â¦>\è“\ÌX/%/\ïO…¥\îK\à\Ğ\æ×¶f›½r¶D8\Â\ãa3J~m¿	§\nø€úü7¶V2Š÷ò\Ã8;X*Xo3¿f\ß\0\n\0÷pği?VJ›ú`\Òd\ìf,\Ø70\\\n\0w°©\æ¶2psß€·„À\Ï6õe9\ë\Ó>\Ûm›]k<\á€³©¸e`²)\0dSpT\ÊÀ\äQ\0Â¦>`T”É \0L¸ù×¶šƒ‡şJ\í,À\ÊXoK^e`\ì(\0h~mk&öc©±©\è’20V€	2¿¶5[öÊ©\áú] Œİˆƒ2p\İ{zK˜\0ó\ß\ØZj\ŞË¿P;Àn•Ì‹\Ş@\Ø/\nÀ˜š_Ûš™jc%\ÛrÊ˜7_Gœ\Óy\Ñ\İõ)\0c\æ\Ö\Ùıpvo›\åà¢¢Uû\êP\0Æ„1?0±òƒı«µ£‰\Ğcók[3S\ï\ÇJ–<Qf+\Ç8^™»Qb½\Íb¿@€šek¶™Î³‘±¥ó”\Û%\Ë\Åı\Ç, Gæ¿±µÔ´y*JY¨ 72\×Û¦|Í‘\Â\ÑR\0*3\æ8¬Ü(_k÷bõú8Eğ¨€J\æ_Ùš-\Óyªd¬ó‘©À#S\0:6ÿ\Ú\ÖB“y*JYª`ü™\n<, #ó¯n­4cş¹\ÚY\0&’©À‘(\0\Çh~mk¦Ù‹\Óù’õ}€®8Ap\nÀ1pŒ n½W`¯œ³<ğQ\nÀÍ¿¶µ\Ğ|\Ú_©€\Ûdn´M¹hy\àg€˜uk¥‰|\Éù}€¾\Ë\í6Ë¹x,Ö‡¾< \0<‚ùW·VJÉ³\Ö÷\ÆL\æn–r1|z@8¢ùµ­™Ø‹\Ó\å\à(Ÿõ}€±—«9À}\nÀ!\İzqOxqÀd\Ê\\\ÏR.^ñ\ÄF\í(]P\0\à\æƒÿ¬}\0‘¹‘¥œ›ô\" \0\Ü\Ãü«[s\å\à\Å=+µ³\0PA\æFNğ\É\àC\æ_\ÛZ(™g\í\è\à@ng–s×¿rbµv’QR\0nò\à\àşr;K93)Á\0~\0dBö¶\0Ì¿¶µP\Úöl4\ÍB\í,\0Œ¡¶\İÈ¦\Û\"0¸ğÁƒ\ß\'~\0F!s#\Û\æä¸½G`0Àƒ€ã•«ùXsf\\^1<ñÀƒ€\Îd\îf\Ä\Åx¼¹\Ğ÷\"0±Àƒ€zr;\Û\æ\Ìõ\ß\ïï‰‰+\0ó¯lÍ–©ö|DYª€\Ë\Ü\ÈÒœ¹ş•›µ£|\Ø\Ä€›~¯\ì 2/\ä\ãÍ¹>-Œ}˜_Ûš‰\í\éR\Ê\Ù\ÚY\0\à2w3›“}Y\ë0ÿ\ê\Ö\é’\íY·ó06zrlp,Àü×·–²iÏ—(³•£\0À‘e\æn)Í¹\ë_9q¡V†±*\0ó¯n\Íe¶ç‹ı\0L€\Ì\Ü(•¦cQ\0\æ×¶fòF{¶”rºv\0¥ZÓ€\Ş€ùW·Ng¶g‹u~\0&XF®—Çš“]\èm˜mk!³=_¢\Ì\Õ\Î\0]\È\Ì\İ\Ò4\Ë]\\0Ô»`\ÜÀ\àe»ş\Õ_~ù8ÿˆ^€ù¯o-ei/÷0t™¹Qo–kI `ş•­\Ùl\ÚKv÷À\Ï\Ü\Ü ø\Ìq¼J¸õ7<ªùW·NgÓ¾\å\á\0w:˜ˆ\ç[ó¯n­Œü{ú–Oı\0px™y\á~õ—ÏŒ\êûU)\0ó_ÿ\Ş\é,\Å\Ñ>\08‚Œ\\-5gF±/ \Óps‡ÿ¥\áª^\0x™¹Y>6õÌ£–€\Î\nÀü+\ß]\ÈR\Ö|\ê€G3Š\Ğ\É&Àù?ıÛ—£i®yøÀ£+¥\Ì\å{û\×\æ×¶ú¹z¬€›#ÿµ±pœ\0Ñ£L­\0ùÀñ{\Øp,\às_ÿ\Ş\éR\Êù\ãø\Ş\0À2s³9b	yø¯ÿ\í¥(±2\ê\ï\0\Ü\ÛQKÀô¨ş\àùµ­™ö½ıkQ\Â\í}\0Ğ±ƒ\íùˆ8y˜¯\É)€ùW¶f\Û÷ö¯•\â\ê^\0¨¦\Ä\Ê\çşôo_>Ü—>¢ùW·\æ\Úv\ß?\0\è‰6\Û\åÿıûÿiı~_óHÀ\Ã\0ú\'3w›œzúúœØ¾\×\×<ô€‡?\0ôS)e¦m\ÚK÷ûš‡*\0ş\0\Ğo%b\á~û¼\à\á\0\ã\á~KGš\0xøÀø¸\ßRÀ¡\'\07\ÏùoyøÀx¹Û©€CM\0n½\ä\Ç\Ã\0\Æ\Ï\İ^\Ï¨	Ào|ı»—\"\Ê\Ê\È\0ÈŒ“ÿ\ëş\ãê­Ÿ?pğ¹¯ï´‡?\0Œ¹’goÿ\é}Àü«ÿw®D¸\Õ\0\Æ\\‰2û¹W¾·r\ë\ç÷,\0ók[3mÛ¬u\n\0\è@‰—nı\ã=@¾»w¶D™\í \0Ğ±0ÿ\Ê\Öl\Ä=\nÀ~\å»Q\Ê\éNS\0\Çn?öNEDL\ß\í7›(\ç³\Û<\0@J,EÄ™ü\Ü+\ß[‰÷½@\0\0_MNø\È@~\è˜\0\00YÚ²¿t\ÇÀ\Í\ã³U\Ò\0\0\İÈ˜¿c\à\Ó?\0L¾,9÷Aø/_ÿ\î’c\00ùJ”\Ù\n@\Éò\Ò}¾\0˜ %\âƒ\Ûşvj‡\0º\ÑDD´\ï\î/\Õ\0t\ç\ÖÀb\Õ\0@§šˆˆŒ\\¨œ\0\èP3ÿ\Ê\Öl)e¦v\0 ;\Í~Ù›«\0\èVS2\0\0˜\é\Ìøl	wÿÀ4\í\Î?\Ï\Ö\0t\ë#·\0“o:>ñs\0\0``L\0\0`€šfúcµ3\0\0kbú±\Ú\0€Y\0€j¢”\Í\Ú!\0€n59[;\0Ğ­¦d¸\0\Æ\0\0 \0\0¨\É(³•3\0\0kJ‰\Ù\Ú!\0€nY\0€R\0\0`€\0\0 \0\0h:2kg\0\0:f\0\04\íó?\0	\0\0\0\0¤\0\0À\05¹÷^\í\0@‡ò\ÆO£‰¶­\0\è˜%\0\0 &n¼[;\0Ğ¥\ï\Ú\0\0C“{\ïE“7~Z;\0Ğ¡6\æOT;\0Ğü\é\"\Úö` \0\0\Ãp\ë™P\0nü4ò½ŸT\r\0¯|\ï\'qk\é¿ÉŒİˆˆö‡ÿ‘\Ş	\0\0)Ûƒg}Dd\ÆnS\"7#\"b\ïƒ\ß\0\0&Kû\Ã‹\Øß‹ˆˆ¹9‘\×K\ÆBDDşû#ûx”OübÍŒ\0À\åOù\ï?ü\Ù\Ï#¯7SM®\ßşE\í;ÿbS \0Lˆüé¢}\ç_\îøµ©&\×KDÄ¯ÿñ\ëo7AB}\0\0\ÜIDATE‰¹\Û³ù…ÿ\å\è0\"\00Jù\ãhüƒıblş\Õıö\Ó7\ï(?üjüƒhğ¬\0\0cb/\Úü\ãGşq\ë™_nıônS€ˆˆhšh~n&\Ê\Ï2¢¸;\0z+\ÛÈŸ¼\í¿\ï\Æ]oû½ù\é?\"búÖ¯µS\íÉ¦m\Şú\È·\íAƒøñ¢|\â£|ü\ç£<ş	e\0\0ú Ûƒ÷ù¼û“\î\ák§Ú“·ş¹\Üş¿ö\'¯Ÿ.\çõNMG™z,¢i¢L\ìa\"\0!÷Ş‹h\Û\Èı÷½TŸgşúûÂ­Ÿ—Á¯ı\É_\\*QVF\0¨)#Wÿú\ç\ä\í¿ö‘¡\0À¤¸\Û\Ã?\â\æ]\0ö\×ø;\'3\â\Ìñ\Ç\0\ËÁ\Øÿ£ÿˆ{L\0nù\Õó>\×\ì7—\îz:\0\0è§Œ\Ívª=ù\Î<·y¯/¹o¸\å\×ÿø[+yJ\0€\ËØŒ(ÿê¾´ú /=T¸\åW\Ïÿù\\Ó–¥Œ˜/Q6\00\Z¹Q\"®·M®\ß\ïÿ‡©\0\ÜÍ¯ÿ·o-<\ê÷\0\0\æ¯ş\ë—6jg\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€‡÷ÿ8µEG6›4\0\0\0\0IEND®B`‚','image/png');
/*!40000 ALTER TABLE `imagenes_perfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ingresados`
--

LOCK TABLES `ingresados` WRITE;
/*!40000 ALTER TABLE `ingresados` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingresados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ingresados_empleados`
--

LOCK TABLES `ingresados_empleados` WRITE;
/*!40000 ALTER TABLE `ingresados_empleados` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingresados_empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `medicamentos`
--

LOCK TABLES `medicamentos` WRITE;
/*!40000 ALTER TABLE `medicamentos` DISABLE KEYS */;
INSERT INTO `medicamentos` VALUES (27,'Bencilpenicilina','1000 ml','Frasco Ampolla','In-venoso'),(28,'Dicloxacilina','120 mL','Frasco','Oral'),(29,'Amoxicilina','500 mg','Capsulas','Oral'),(30,'Cefazolina ','1 g','Frasco Ampolla','In-venoso'),(31,'Cefalexina ','500 mg','Capsula','Oral'),(32,'Ceftriaxona ','1 g','Frasco Ampolla','In-venoso'),(33,'Clindamicina ','300 mg','Frasco Ampolla','Oral'),(34,'Cloranfenicol ','500 mg','Capsulas','Oral'),(35,'Amikacina','1 g','Frasco Ampolla','In-venoso'),(36,'Furazolidona ','100 g','Tableta','Oral'),(37,'Fluconazol ','2 mg ','Frasco Ampolla','In-venoso'),(38,'Levofloxacina','500 mg','Tableta','Oral'),(39,'Aciclovir ','500 mg','Frasco Ampolla','In-venoso'),(40,'Abacavir','300 mg','Tableta','Oral'),(41,'Zidovudina ','10 mg','Frasco Ampolla','In-venoso'),(42,'Omeprazol ','40 mg','Frasco Ampolla','In-venoso'),(43,'Loperamida ','2 mg','Tableta','Oral'),(44,'Dimenhidrinato','50 mg','Tableta','Oral'),(45,'Metoclopramida ','10 mg','Tableta','Oral'),(46,'Benznidazol ','100 mg','Tableta','Oral'),(47,'Mebendazol ','500 mg','Tableta','Oral'),(48,'Beclometasona','50 mcg','Aerosol','Inhalado'),(49,'Nitroglicerina','0.2 mg/h','Parche','T-dermico'),(50,'Flufenazina','25  mg','Ampolleta','I-Muscular'),(51,'Medroxiprogester','150 mg','Ampolleta','I-Muscular'),(52,'Dorzolamida','5 ml','Frasco','Oftalmica'),(53,'Latanoprost','2.5 ml','Frasco','Oftalmica'),(54,'Permetrina','30 g','Tubo','Topico'),(55,'Tretinoina','30 g','Tubo','Topico');
/*!40000 ALTER TABLE `medicamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `municipios`
--

LOCK TABLES `municipios` WRITE;
/*!40000 ALTER TABLE `municipios` DISABLE KEYS */;
INSERT INTO `municipios` VALUES (1,'Sonsonate',2),(2,'San Antonio del Monte',2),(3,'Sonzacate',2),(4,'Nahulingo',2),(5,'Nahuizalco',2),(6,'Izalco',2),(7,'San Julian',2),(8,'Juayua',2),(9,'Salcoatitan',2),(10,'Armenia',2),(11,'Caluco',2),(12,'Armenia',2),(13,'Santa Catarina Masahuat',2),(14,'Santa Isabel Ishuatan',2),(15,'Santo Domingo de Guzman',2),(16,'Acajutla',2),(17,'Ahuachapan',1),(18,'Apaneca',1),(19,'Atiquizaya',1),(20,'Concepcion de Ataco',1),(21,'El Refugio',1),(22,'Guaymango',1),(23,'Jujutla',1),(24,'San Fransico Menendez',1),(25,'San Lorenzo',1),(26,'Tacuba',1),(27,'Turin',1),(28,'Candelaria de la Frontera',3),(29,'Chalchuapa',3),(30,'Coatepeque',3),(31,'El Congo',3),(32,'El Porvenir',3),(33,'Masahuat',3),(34,'MetapÃ¡n',3),(35,'San Antonio Pajonal',3),(36,'San Sebastian Salitrillo',3),(37,'Santa Ana',3),(38,'Santa Rosa Guachipilin',3),(39,'Santiago de la Frontera',3),(40,'Texistepeque',3),(41,'Antiguo CuscatlÃ¡n ',4),(42,'ChiltiupÃ¡n ',4),(43,'Ciudad Arce ',4),(44,'ColÃ³n ',4),(45,'Comasagua ',4),(46,'HuizÃºcar ',4),(47,'Jayaque ',4),(48,'Jicalapa ',4),(49,'La Libertad ',4),(50,'Santa Tecla',4),(51,'Nuevo CuscatlÃ¡n ',4),(52,'San Juan Opico ',4),(53,'Quezaltepeque ',4),(54,'Sacacoyo ',4),(55,'San JosÃ© Villanueva ',4),(56,'San MatÃ­as ',4),(57,'San Pablo ',4),(58,'Tacachico ',4),(59,'Talnique ',4),(60,'Tamanique ',4),(61,'Teotepeque ',4),(62,'Tepecoyo ',4),(63,'Zaragoza',4),(64,'Agua Caliente ',5),(65,'Arcatao Azacualpa ',5),(66,'Chalatenango',5),(67,'Comalapa CitalÃ¡ ',5),(68,'ConcepciÃ³n Quezaltepeque',5),(69,'Dulce Nombre de MarÃ­a',5),(70,'El Carrizal ',5),(71,'El ParaÃ­so',5),(72,'La Laguna ',5),(73,'La Palma ',5),(74,'La Reina ',5),(75,'Las Vueltas ',5),(76,'Nueva ConcepciÃ³n ',5),(77,'Nueva Trinidad ',5),(78,'Nombre de JesÃºs ',5),(79,'Ojos de Agua ',5),(80,'Potonico ',5),(81,'San Antonio de la Cruz ',5),(82,'San Antonio Los Ranchos ',5),(83,'San Fernando ',5),(84,'San Francisco Lempa ',5),(85,'San Francisco MorazÃ¡n ',5),(86,'San Ignacio ',5),(87,'San Isidro ',5),(88,'Labrador ',5),(89,'San JosÃ© ',5),(90,'Cancasque ',5),(91,'San JosÃ© ',5),(92,'Las Flores ',5),(93,'San Luis del Carmen ',5),(94,'San Miguel de Mercedes ',5),(95,'San Rafael Santa ',5),(96,'Rita Tejutla',5),(97,'Aguilares ',6),(98,'Apopa ',6),(99,'Ayutuxtepeque ',6),(100,'Cuscatancingo ',6),(101,'Ciudad Delgado ',6),(102,'El Paisnal ',6),(103,'Guazapa ',6),(104,'Ilopango ',6),(105,'Mejicanos ',6),(106,'Nejapa ',6),(107,'Panchimalco ',6),(108,'Rosario de Mora ',6),(109,'San Marcos ',6),(110,'San MartÃ­n S',6),(111,'an Salvador ',6),(112,'Santiago Texacuangos ',6),(113,'Santo TomÃ¡s ',6),(114,'Soyapango ',6),(115,'Tonacatepeque',6),(116,'Candelaria ',7),(117,'Cojutepeque ',7),(118,'El Carmen ',7),(119,'El Rosario Monte ',7),(120,'San Juan Oratorio de ConcepciÃ³n ',7),(121,'San BartolomÃ© PerulapÃ­a ',7),(122,'San CristÃ³bal ',7),(123,'San JosÃ© Guayabal ',7),(124,'San Pedro PerulapÃ¡n ',7),(125,'San Rafael Cedros ',7),(126,'San RamÃ³n ',7),(127,'Santa Cruz Analquito ',7),(128,'Santa Cruz ',7),(129,'Michapa ',7),(130,'Suchitoto ',7),(131,'Tenancingo',7),(132,'CuyultitÃ¡n ',8),(133,'El Rosario ',8),(134,'JerusalÃ©n ',8),(135,'Mercedes ',8),(136,'La Ceiba ',8),(137,'Olocuilta ',8),(138,'ParaÃ­so de Osorio ',8),(139,'San Antonio Masahuat ',8),(140,'San Emigdio ',8),(141,'San Francisco ',8),(142,'Chinameca ',8),(143,'San Juan Nonualco ',8),(144,'San Juan Talpa ',8),(145,'San Juan Tepezontes ',8),(146,'San Luis Talpa ',8),(147,'San Luis La Herradura ',8),(148,'San Miguel Tepezontes ',8),(149,'San Pedro Masahuat ',8),(150,'San Pedro Nonualco ',8),(151,'San Rafael Obrajuelo ',8),(152,'Santa MarÃ­a Ostuma ',8),(153,'Santiago Nonualco ',8),(154,'Tapalhuaca ',8),(155,'Zacatecoluca',8),(156,'Apastepeque ',9),(157,'Guadalupe ',9),(158,'San Cayetano Istepeque ',9),(159,'San Esteban Catarina ',9),(160,'San Ildefonso ',9),(161,'San Lorenzo ',9),(162,'San SebastiÃ¡n ',9),(163,'San Vicente ',9),(164,'Santa Clara ',9),(165,'Santo Domingo ',9),(166,'Tecoluca ',9),(167,'TepetitÃ¡n ',9),(168,'Verapaz',9),(169,'AlegrÃ­a ',10),(170,'BerlÃ­n ',10),(171,'California ',10),(172,'ConcepciÃ³n Batres ',10),(173,'El Triunfo ',10),(174,'EreguayquÃ­n ',10),(175,'Estanzuelas ',10),(176,'Jiquilisco ',10),(177,'Jucuapa ',10),(178,'JucuarÃ¡n ',10),(179,'Mercedes UmaÃ±a ',10),(180,'Nueva Granada ',10),(181,'OzatlÃ¡n ',10),(182,'Puerto El Triunfo ',10),(183,'San AgustÃ­n ',10),(184,'San Buenaventura ',10),(185,'San Dionisio ',10),(186,'San Francisco Javier ',10),(187,'Santa Elena ',10),(188,'Santa MarÃ­a ',10),(189,'Santiago de MarÃ­a ',10),(190,'TecapÃ¡n ',10),(191,'UsulutÃ¡n',10),(192,'Carolina ',11),(193,'Chapeltique ',11),(194,'Chinameca ',11),(195,'Chirilagua ',11),(196,'Ciudad Barrios ',11),(197,'ComacarÃ¡n ',11),(198,'El TrÃ¡nsito ',11),(199,'Lolotique ',11),(200,'Moncagua ',11),(201,'Nueva Guadalupe ',11),(202,'Nuevo EdÃ©n de San Juan ',11),(203,'Quelepa ',11),(204,'San Antonio del Mosco ',11),(205,'San Gerardo ',11),(206,'San Jorge ',11),(207,'San Luis de la Reina ',11),(208,'San Miguel San Rafael Oriente ',11),(209,'Sesori ',11),(210,'Uluazapa',11),(211,'Arambala ',12),(212,'Cacaopera',12),(213,'Chilanga ',12),(214,'Corinto ',12),(215,'Delicias de ConcepciÃ³n ',12),(216,'El Divisadero ',12),(217,'El Rosario ',12),(218,'Gualococti ',12),(219,'Guatajiagua ',12),(220,'Joateca ',12),(221,'Jocoaitique ',12),(222,'Jocoro ',12),(223,'Lolotiquillo ',12),(224,'Meanguera ',12),(225,'Osicala ',12),(226,'PerquÃ­n ',12),(227,'San Carlos ',12),(228,'San Fernando ',12),(229,'San Francisco Gotera ',12),(230,'San Isidro ',12),(231,'San SimÃ³n ',12),(232,'Sensembra ',12),(233,'Sociedad ',12),(234,'Torola ',12),(235,'Yamabal ',12),(236,'YoloaiquÃ­n',12),(237,'Cinquera ',14),(238,'Dolores ',14),(239,'Guacotecti ',14),(240,'Ilobasco ',14),(241,'Jutiapa ',14),(242,'San Isidro ',14),(243,'Sensuntepeque ',14),(244,'Tejutepeque ',14),(245,'Victoria',14),(246,'AnamorÃ³s ',13),(247,'Bolivar ',13),(248,'ConcepciÃ³n de Oriente ',13),(249,'Conchagua ',13),(250,'El Carmen ',13),(251,'El Sauce ',13),(252,'IntipucÃ¡ ',13),(253,'La UniÃ³n ',13),(254,'Lislique ',13),(255,'Meanguera del Golfo ',13),(256,'Nueva Esparta ',13),(257,'Pasaquina ',13),(258,'PolorÃ³s ',13),(259,'San Alejo ',13),(260,'San JosÃ© ',13),(261,'Santa Rosa de Lima ',13),(262,'Yayantique ',13),(263,'YucuaiquÃ­n',13);
/*!40000 ALTER TABLE `municipios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pacientes`
--

LOCK TABLES `pacientes` WRITE;
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `receta_medicamento`
--

LOCK TABLES `receta_medicamento` WRITE;
/*!40000 ALTER TABLE `receta_medicamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `receta_medicamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `recetas_medicas`
--

LOCK TABLES `recetas_medicas` WRITE;
/*!40000 ALTER TABLE `recetas_medicas` DISABLE KEYS */;
/*!40000 ALTER TABLE `recetas_medicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administradores'),(2,'Doctor'),(3,'Enfermero');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sangretipos`
--

LOCK TABLES `sangretipos` WRITE;
/*!40000 ALTER TABLE `sangretipos` DISABLE KEYS */;
INSERT INTO `sangretipos` VALUES (1,'O-'),(2,'O+'),(3,'A-'),(4,'A+'),(5,'B-'),(6,'B+'),(7,'AB-'),(8,'AB+');
/*!40000 ALTER TABLE `sangretipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (6,'admin','21232f297a57a5a743894a0e4a801fc3','2017-05-18 21:19:38',1,NULL),(7,'kevi','47c6b15aca93873f58522f26300d181d','2017-05-18 21:42:18',1,NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-02 23:40:53
