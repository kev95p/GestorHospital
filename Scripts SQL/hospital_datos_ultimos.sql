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
INSERT INTO `departamentos` VALUES (1,'Ahuachapan'),(2,'Sonsonate'),(3,'Santa Ana'),(4,'La Libertad'),(5,'Chalatenango'),(6,'San Salvador'),(7,'Cuscatlan'),(8,'La Paz'),(9,'San Vicente'),(10,'Usulutan'),(11,'San Miguel'),(12,'Morazan'),(13,'La Union'),(14,'Cabañas');
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
INSERT INTO `imagenes_perfiles` VALUES (1,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0�x\��\0\0\0sBIT|d�\0\0\0	pHYs\0\0\�\0\0\��+\0\0\0tEXtSoftware\0Adobe ImageReadyq\�e<\0\0 \0IDATx�\�\�Ks]\�y&\�om@��K\�Ke9+\�\�@�$�n�\�\�D\0)����_@��SwR$\�\��\�D6E\��{��@Ȱ\�NJ��ri�%�(`=\0)�/\0y�\�>g?O�Dߒm\��|k��\"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��R;\0\�O/^ۙk�b\��_k�c��g�ج�	\0\�\�vf��b6�f!\"�D\�GDd\�L)1�0\�33�K�툈�܌(\�d�͒��\�|���\�$FM�	�ⵝ����\�Rr�D�JD����*a2v�\�fF\\\�,��M\�o�\�3OlW\�|@�1�\�k;�\�\�O͕\�Η(sQ\�A�Qr#�\\/S\�e\�\0cf�\�\�\�\��\�R[r>�,���3=��\�,��\�\\ޟ\�߸�\���#��S\0`�xmg�m\�K7��V?^r�d�|c�]W\�x(\0\�SϿ�åR\�Œe)ʝ��\�\�d \���\r�0Z\n\0���e\�v����T�j*\0�N�ʾzmgv�-�\"\�\�D�\�����\�t��&���\0@%/��\�J�x)\�a\�~Oe\�\�t�\�8:\0:t\�\�~ɲb\�?:�\0�\0x\�\�\�Biʩ��T;\�\�\�\�\�����=�`\n\0�\�\��\�RS�T�w\'c�D�y\�7?�Z;\n��\0\�\�\�7\�Yi#\�\�\�W\�\�TӞ�,\0w�\0�y��OF��\�>�r\�\�7\n\0���\Zs6��{)36��\�e\�\0�\0�W�\�\�\�ͥ�\�\�?{\�\n\0<�\�k;3\�m9QN\�\�\�Q\�\�^�g�`\�\08�\�\�|g�D�w�|e\�\�\�T{\�5\��\0��xmgvj�\\*\���!c7\"�]2\�P5��8x\�\�\�\�\��e\�\�����R�=�\�\�J\�(P�	\0\�ǋWv\���ʥ1W;\�(\�\�7��9S;tI�{X~s\�t\�|\�t$c��\�Μ���\0��,^ۙ�\�/k\���0 �\0�m�sgiz\�Z�`�Xy\�\�\�\�1�\n\0\��\�՝�K�5\��N	` ,0xF�ܕ\�\0&����xeg�m\�Z����Q�`�\0�\�\�\�Yj�r\�ß{*��\�՝�kǀ\�`� =�\�\�J�b��C\�ȓ��O�\�\���\008/\\\�=%\\\�Ñ4���k_tw\0�C`P^��{)J�\�\��\�\�ݛ\�ndR\��`x��HJ\�L\�k�c���\00��c�\���P\0�h7�\�\\\�\�(e\���\�\�s��P\0�h\�o\�^�ɟ�\�\�ݷ�1g\0k�\�.y�s,J\�4\�\�Z\��(L\0�H��R;�-3ά�\�j瀇�\00q<�\�L\�\��~y��خ�\�\0\��+;+�t���f*�Q��d�\�x�͝�Ȱ.K�J8�\�Q\0��Wv\�J^�Rfjga�2w�+N0V,0��\�\�L5�\�\�O5�\�L\�\�\�\�1\�(\0\�\��q�2[9�WN/~kg�v\n8,���|u\�\�R\�B\�aC \�\�\0\�\�Ww2\�\�,�J�x\�\�>�Q;<�	\0ci�\�\�L�7�\�?m\��xP\0K\��6�\�O���\�\�\�Y��D`\�,��sں?��y�vx{\0+�\�ڙ��ʷ|������3`�4Sy\�ßq�m���\�G`l�3NJ)/\\\�Y��\�e�v\08�\�k;3�~�M�V��<8�Q;܍	\0c�\�\��F���R���R\0\�ū;\�_\�T3\�\0��@\�5\�Hc,ci�ڎ\��c\0��xeg%2\�\"�vxX3\���j�ۙ\0\�[�\�vf�\�\Z�2ZG\��\�jn��]�\�d(���\�3\n\0�ts\�ԧ&&F�\�K�3�\�\0z��ўv쏉b3 =�\0\�;>�3�J��\�@zC�w|�gR5�]��n�^Uze�\�\�Ls�\�R\0�T\�c\�\�\�<�[;�\0\�/7b\�ß�f��P\0\�\���t�\�K\0�\�\�w��&\�j\�\�f�>0�7�\�9i\�2\0=�\0\�W�)2Mi\�kg\0�^h�v�v\�L�\0P�=\0�\�\��o\�{��\���\�/>�Y;\�e@u�\�\�Y��gxZS\0�R\0��4�E1<���\�S�%\0�Z��3S����J\��\������!{/jG`��k`\�J����S@�\�|D�\�\��0�\0P��PW\�B\��@5�\��W����\�.�jJ4vA3x�\��ׅ\�&��\�\0�f�v�I��\�+;sv�CD���\�&�:r�v\��D��R����(e\�\�6L\�@-�@o�=�\�@\�\�z�)�@\�\0�g\�3\��F@jP\0\�\\�����%M\0蜻\0\�\\�9W��(\�g\�l\�\0�	\0�Z��3W�����7��)\0tlߨ\�)��#0,\n\0�\�(6;�]�\�\����\0�]�ͱtL�[m�\0�ݴio�r\n�\�,^ۙ���g\"�v\�RL\�\�	\0\�y\�\�N\�~\�	@�\0�S�\0��7[;á\0Й\��l\�\�oe�r\0D�;&\0�\09[;á\0Н��\�>��)�Q\0\�]\�� e�r\0D��\�v|��1%�C\n\0\�pȔ�.)\0\00@\n\0�h#2\"��Ï��X��Ϧ\0tB\0蓶��N(\0t�D|�v\0~F�\�%@p(m\�B\��\0\0�\0\0�\0)\0t#\�\0B��+�30\n\0�(�\�\���\�\�\0\�\0\04];\0�Y;��_�#&\0\0�Rf+` \0�)%fkg`\0�\�\��i�v\0\�\0Ё\�\�\�	\0��\0\0�\0\0�\0)\0\0=c\�]P\0\0zǾ��q\��Bӄ�د�A��2\0�\0\0�\0\0�\0)\0\00@\n\0\0���\��v�v\0\�\0p\�^\�S��3\0p\'\0\0H\0��&@��Y;��Rj\'`\0L\0\0`�\0\0 ��8	\0\�#\n\0\�\��.\0�Q\0\0`�\0���~wڒ\�\�1@:�{\0j\�qpy�	Kf;\0:�\�\�\�\0�\�(\0\00@\n\0\�(\�H�G\0�Q�MM\0=�\0\0�L\'\0:\�X��f\��N8\�\�/\n\0�\��\��/\0:S\�\�&<HFٮ��aP\0\0z%߮��a�*`:�\�K\�B\�\0�\0\0�Kk�\�P\0\�N\�nԎ\0���\�\�	\0\0H�3�\�\'7jg�����\�\��Ny\0\�\�\�/=�];à\0Щ.\�\�\0\�T�Y\"j\�>ʈ�\�\0:U\"ީ�\0��9\n�c��\�(\0tj\�g�\'2��\0Щ+_zr\�I\0��L�\�(\0T\�$\0\�M\�v�v�C�\0\�\�]R\0\�^\�\�Ԏ\0}t\�K�\�@\r&\0�.�[\n\0�{��O��>$�\�K�\0��\�3�S��^;â\0P�)\0ܮu<�n��:����R;�=\0t\��*��,�\��>�\0\�)��\����vJ��\�9���\�}��\'����a1���\����\�)\0TS�\��a��\Zl��,e#\"kǀ>�vL:g@5�?��M7BDq (\0TU\����/?�Q;ã\0P�}\0]��\�P\0�\�`\0�\0ԡ\0P\�\�\�}j3�2`�\r�T�\0P���2S0jQ\0�/\�r\�P�뱩E��\��?�Q;\�`�EM\n\0\�]^~b7\"\�k\�\�e:C5\n\0�\�8 ��N\0P�@/\�M�\00<���\�u��Ɨ��?�UJ\�\�\�]Ȍ\�o�\�O\�\��p�\0\�Mi�V;th�v\0�M�7��\Z\�\0Hk\�U)\0�ƕ\�\'�3æ(\����30lӵ��_�h\�`�en\\^>\�*l�2�W\�2\0CP{�>�^�����\�R�@\�d\�\�\�\�d\�\�\�\�=�\�R�@\�|�}ק#&V�\�kzB�w6G\�j\�p\�\��?��\0\�O��f\"�p\�^Lo}\��\�VD��F&#ֿ�\�\'�k\�\0z�x50%\�0٢7\0z�݋\�\�`�Z\���?\0z\�\��\�a�����W��ܮ�nQ\0\�\�`B�풞Q\0\�+_~r#\"�k\�G�����3�\�\0z�m˹\�\�Qdĺ\�\��\��x�\�zF�˓�e�?}�\0\�{��O\�{S�\�\�?�\�t\�\0p�\�{\�\�\�\�\�\�\�GU\"��\�%\0\�\�\�\����\�\���-�\�����\�\��\�f@\�Ln�d��Q\0/QqK c$\�]��\0Ɗ)\0\�\�c\�\�\�\�^\0Ɗ)\0\�#Wm��\�\0Ǝ)\0\� m��\�\0Ǝ)\0}��6�\�w\n\0c\��~+6�\�{\n\0c\�\�U�j瀏\�\�+�O�\�N�\00�>��޹tG\0=�\��\n\0c\���\�\�4j�72b�\�\�\r�)Ƃ�X���\�#r�v���̋��1.\0\�^�8S;��ϸQ\0{\��\�O�G\�F\��O����\�L�)\0\���\�8R\0��?�Ԧc�T\�\�?cH`b8H\r>�3�\0&\�\�\��M\�\�\�9��S�v\0�ߺ�\�J\�B\�\�\�\�\�\0Ɛ	\0��\�ɰ@\'�?\�J`\�ܼ\'�eA�\�+�O�\�K`\"���\��Q;�m=e�)\0L,K�\��+˟٨��Ĳ�1ٍ��韱�\00\�\�X��\�\\���ɑ\�,?�];<*���n�o)�Q\�|c�\�^�\�DP\0�xחO\�F\�.\�\���k[/�br(\0\�\�\r[��(\�]]~j�vodP�%���ye�\�O\��d���\�\�X�8\"�&���\\_>�۶�L\����8c�\�$R\0��\�Omf�s\�<PFl\��ϤR\0�7?}!3Vk\�\�vo.�D�	�A�\�\�x+\"\�j\�\�6�6�g��\00h\�7�\�\�\�\�9\�\���	\0��\�\��\�J�k1S;}��o,}Ʈ&�\0�A	x�vj\�\�7�>\�?�`	\0\�\�ɀ��-7\�\�=GD\0�ͳk\�_)%.\�\�A\�v3\�\���	\0\�\�\��S��\�΀a��g�L\0\�.~k�\�/E��\�98v��\0��L<M��P&��?�g\0\�\��y�\\���\�*�\���\0�L�\�<we�3�s@m�\0\���qu\�)g�!L\0\�\��zY\�\�mr\�p�\0Gpu��\�Ȳ���pD�\�,?�];�%\0xϮ}.J��(���pF��Q&\0��.?�y#��Έ�\�Yx0��(\0xD\�\�oq\�\�\�Sgj瀾1�Gt�\�x{�i�F�\�n�\0F\"\�k\'\�2�\��\�\�\�\�t\�\00���%Wj\�\��7b\�B\�\�W&\00o,z=,�O�p_&\00\"\�\�F)�T;��{����c\0�R\�z\�ܒ�>�\��)\00\"%\�F\�h\��\�\��\�\0F\�ٵ�\�\��.37\�|������\�\0F)s�v��+%}��CP\0`�2�u\�\�nD\�p\n\0�P)�7�3Yfn\����\0\0��r�v\n\0�P\�v�����\�S\0���˟٨�ƅ\0L�\�ܬ�Ɖ\0L�\�.8\0F�D\�\�\�0X�x3�\0#T\"fjg\08\0F(3>[;�a�F*g\�U���\�\0F���\�\0C�yv\��6\0cC�\�ȅ\�-�#�8�\0F$\���R��\�R2M`\�L\0`���5[J�\0�ʿ8\n\0F`�mVjg�3_\\ۚ�ƅ\0#P������6��\�`l(\0���]{{%�7\0�A��X;�;�\�̯m\�<\�Nm)\0�1U�O\\Y>�];��	\0<�\�9\�\�\�/�c�\�\0�Czv\��s�\�[�s�!�\�7�\'�/�p=0܇	\0<������ݿT;wQbf�mN׎}�\0�C�n�\�;�\�_����\��)\0pDϮ��RJ�\�\����	\r܇\0G�\�\�\�+�Ńe����o��r\�\�W6\�!}~\�\�\�\�?v�\��w�i�v\�\0`~mkf:�\�F��e\�(c�i�g�.?�Y;\n�\0��\�\��\�ڶ=\��ǟ\0�\0��|~\�\�h\�]�F	�;(\0�k[�\�m�QNy�\�\�؍�,�\��g6jG�\�\0\��m-DS^�\���C��g��\�g/\�\�5)\0\��\�\�\�\�~��J	c��\���&Oze0C�\00�k[�\��\�TDq}/2�#ۓ�≍\�Q�k\n\0\��\����Rڗ\"\�R\�,�T慽�<g\Z��(\0L�������Y)��\�l\�<���\�8��\��\�j\�(\����\�\�\�\\ۖS�eɘ����m\�Y`\�)\0L�\�\�\�(�R�X���ɠ0\�\0\�\�g�\��>\�s,&��عyv��M}t)36#\�=L\n��p\�\�~�8kSUe\�F\�\�\�T^��|b�vxX\n\0�fS}vk*�?ծ;BȸQ\0\�%��?��Y.+��ް��I�qy�i\�-\�W\n\0\�}ᵭ��)��M}L��\�\\/\�\\�\�\��\�z\�8p�@�\�\�\�\�\��d\�F9�l\\_>�Y;å\0Щ�����-��M}p0(�Q���?��a\�\0]R\0\�\�\���JD�\n\�\�\�=\�6�w�c�\0pl\�׶f��r��~�\�\����\�}����}ɦ>��\\/\�7L���_ۚi\�\�t\�xɦ>8f�Y\�r�߮_����<�G�׶\�(/�+��� elg\�F)y�;�w\�R��\0pd\�句�r*¦>\�\�X/%/\�O��\�K\�\�\�׶f��r�D8\�\�a3J~m�	�\n����7�V2���\�8;X*Xo3�f\�\0\n\0�p�i?VJ��`\�d\�f,\�70\\\n\0w��\�2ps߀���\�6�e9\�\�>\�m�]k<\�����e`�)\0dSpT\��\�Q\0¦>`T��ɠ\0L��׶����J\�,�\�XoK^e`\�(\0h~mk&�c���\�20V�	2��5[�ʩ\��]���݈�2p\�{zK�\0�\�\�Zj\�˿P;�n��̋\�@\�/\n���_ۚ�jc%\�rʘ7_G�\�y\�\��)\0c\�\�\��pvo�\�ࢢU�\�P\0Ƅ1?0�������\�c�k[3S\�\�J�<Qf+\�8^��Qb�\�b�@��ek��γ�����\�%\�\��\�,�G濱�Դy*JY���72\�ۦ|͑\�\�R\0*3\�8�܎(_k�b��8E��J\�_ٚ-\�y�d�����#S\0:6�\�\�B�y*JY��`��\n<,�#�n�4c��\�Y\0&����(\0\�h~mk�ً\����}��8Ap\n�1p��n�W`���<�Q\n�Ϳ��\�|\�_���\�dn�M�hy\�g��uk��|\��}��\�\�6˹x,և�<�\0<��W�VJɳ\��\�L\�n�r1|z@8�����؋\�\�\�(��}����9�}\n�!\�zqOxq�d\�\\\�R.^�\�F\�(]P\0\�\����}\0�������\"�\0\�\���[s\�\�\�=+��\0PA\�FN�\�\�C\�_\�Z(�g\�\�\�@ng�s׿rb�v�QR\0n�\�\��r;K93)��\0~\0�dB��\0̿��P\��l4\�B\�,\0���\�Ȧ\�\"0����\�\'~\0F!s#\�\�丽G`0���㕫�Xsf\\^1<����\�d\�f\�\�x��\��\"0����zr;\�\�\��\�\��+\0�l͖��|DY����\�\�\�Ҝ������|\�\���~�\��2/\�\�͹>-�}�_ۚ�\�\�R\�\�\�Y\0\��2w3��}Y\�0�\�\�\�\�Y��06zrlp,��׷��iϗ(���\0��e\�n)͹\�_9q�V��*\0�n\�e�狝�\0L�\�\�(��cQ\0\�׶f�F{��r�v\0�ZӀ\���W�Ng�g�u~\0&XF��ǚ�]�\�m�mk!�=_�\�\�\�\0]\�\�\�\�4\�]\\0Ի`\��\�e���\�_~�8��^���o-ei/�0t��Qo��kI�`���\�l\�Kv��\�\�\� �\�q�J��7<��W�NgӾ\�\�\0w:��\�[�n���{���O�\0px�y\�~��ό\��U)\0�_�\�\�,\�\�>\08��\\-�5gF�/�\�ps���\�^\0x��Y>6�̣��\�\n��+\�]\�R\�|\��G3�\�\�&��?�ۗ�i�y���+�\�\�{�\�\�׶��z���#���p�\0ѣL��\0���{\�p,\�s_�\�\�R\��\��\�\0��2s�9b	y����\�(�2\�\�\0\�\�QK����\��������kQ\�\�}\0б���\���8y��\�)��W�f\�����\�\�^\0��\�\�\���o_>ܗ>��W�\�\�v\�?\0\�6\�\�����i�~_�H�\�\0�\'3w��z���ؾ\�\�<���?\0�S)e�m\�K����*\0�\0\�o%b\�~���\�\�\0\�\�~KG�\0x����\�R��\'\07\��oy��x�۩�CM\0n�\�\�\�\0\�\�\�^\��	�o|���\"\�\�\�\0�Ȍ��\��\�ꭟ?p�ﴇ?\0���go�\�}����w�D�\�\0\�\\�2��W��r\�\��,\0�k[3m۬u\n\0\�@��n�\�=@��w�D�\� \0Ё�0�\�\�l\�=\n�~\�Q\�\�NS\0\�n?�NEDL\�\�7�(\�\�<\0@J,Eę��\�+\�[���@\0\0_MN��\�@~\�\0\00Yڲ�t\��\�\��U\�\0\0\�Ș�c\�\�?\0L�,9�A�/_�\�c\00�J�\�\n@\��\�}�\0� %\�\��vj�\0�\�DD�\�\�/\�\0t\�\��b\�\0@�����\\��\0\�P3�\�\�l)e�v\0�;\�~ٛ�\0\�VS2\0\0�\�\��l	w���4\�\�?\�\�\0t\�#�\0�o:>�s\0\0``L\0\0`��f�c�3\0\0kb��\�\0��Y\0�j��\�\�!\0�n59[;\0Э�d�\0\�\0\0 \0\0�\�(��3\0\0kJ�\�\�!\0�nY\0�R\0\0`�\0\0 \0\0h:2kg\0\0:f\0\04\��?\0�	\0\0�\0\0�\0\0�\05��^\�\0@��\�O�����\0\�%\0\0�&n�[;\0Х\�\�\0\0C�{\�E�7~Z;\0С6\�OT;\0Ё�\�\"\��`�\0\0\�p\�P\0n�4�T\r\0�|\�\'qk\�Ɍ݈�����\�	\0\0)ۃg}Dd\�nS\"7#\"b\�\�\0\0&K�\��\�ߋ���9��\�K\�BDD��#�x�O�b͌\0�\�O�\�?�\�\�#�7SM�\��E\�;�bS \0L��鏢}\�_\����&\�KDį��\�o7AB}\0\0\�IDATE��\�����\��\�0\"\00J�\�h���bl�\���\�7\�(?�j��h���\0\0cb/\��\�G�q\�_n��nS���h�h~n&\�\�2��;\0z+\�ȟ�\�\�\�]o���\�?\"b�֯�S\�ɦm\��\��\�A����|\��|�\�<�	e\0\0� ۃ�����\�\�k�ړ���\����\'��.\��NMG�z,�i�L\�a\"\0!�ދh\�\����T�g���­�����\�_\\*QVF\0�)#W��\�\�\����\0���\�\�?\�\�]\0�\��;\'3\�\��\�\0�\��\�����{L\0n�\��>\�\�7�\�z:\0\0觌\�v�=�\�<�y�/�o�\�\���[+yJ\0�\�،(�ꏾ���/=T�\�W\���\\Ӗ���/Q6\00\Z�Q\"��M�\�\����\0\�ͯ��o-<\��\0\0�\��\�6jg\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0����8�EG6�4\0\0\0\0IEND�B`�','image/png');
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
INSERT INTO `municipios` VALUES (1,'Sonsonate',2),(2,'San Antonio del Monte',2),(3,'Sonzacate',2),(4,'Nahulingo',2),(5,'Nahuizalco',2),(6,'Izalco',2),(7,'San Julian',2),(8,'Juayua',2),(9,'Salcoatitan',2),(10,'Armenia',2),(11,'Caluco',2),(12,'Armenia',2),(13,'Santa Catarina Masahuat',2),(14,'Santa Isabel Ishuatan',2),(15,'Santo Domingo de Guzman',2),(16,'Acajutla',2),(17,'Ahuachapan',1),(18,'Apaneca',1),(19,'Atiquizaya',1),(20,'Concepcion de Ataco',1),(21,'El Refugio',1),(22,'Guaymango',1),(23,'Jujutla',1),(24,'San Fransico Menendez',1),(25,'San Lorenzo',1),(26,'Tacuba',1),(27,'Turin',1),(28,'Candelaria de la Frontera',3),(29,'Chalchuapa',3),(30,'Coatepeque',3),(31,'El Congo',3),(32,'El Porvenir',3),(33,'Masahuat',3),(34,'Metapán',3),(35,'San Antonio Pajonal',3),(36,'San Sebastian Salitrillo',3),(37,'Santa Ana',3),(38,'Santa Rosa Guachipilin',3),(39,'Santiago de la Frontera',3),(40,'Texistepeque',3),(41,'Antiguo Cuscatlán ',4),(42,'Chiltiupán ',4),(43,'Ciudad Arce ',4),(44,'Colón ',4),(45,'Comasagua ',4),(46,'Huizúcar ',4),(47,'Jayaque ',4),(48,'Jicalapa ',4),(49,'La Libertad ',4),(50,'Santa Tecla',4),(51,'Nuevo Cuscatlán ',4),(52,'San Juan Opico ',4),(53,'Quezaltepeque ',4),(54,'Sacacoyo ',4),(55,'San José Villanueva ',4),(56,'San Matías ',4),(57,'San Pablo ',4),(58,'Tacachico ',4),(59,'Talnique ',4),(60,'Tamanique ',4),(61,'Teotepeque ',4),(62,'Tepecoyo ',4),(63,'Zaragoza',4),(64,'Agua Caliente ',5),(65,'Arcatao Azacualpa ',5),(66,'Chalatenango',5),(67,'Comalapa Citalá ',5),(68,'Concepción Quezaltepeque',5),(69,'Dulce Nombre de María',5),(70,'El Carrizal ',5),(71,'El Paraíso',5),(72,'La Laguna ',5),(73,'La Palma ',5),(74,'La Reina ',5),(75,'Las Vueltas ',5),(76,'Nueva Concepción ',5),(77,'Nueva Trinidad ',5),(78,'Nombre de Jesús ',5),(79,'Ojos de Agua ',5),(80,'Potonico ',5),(81,'San Antonio de la Cruz ',5),(82,'San Antonio Los Ranchos ',5),(83,'San Fernando ',5),(84,'San Francisco Lempa ',5),(85,'San Francisco Morazán ',5),(86,'San Ignacio ',5),(87,'San Isidro ',5),(88,'Labrador ',5),(89,'San José ',5),(90,'Cancasque ',5),(91,'San José ',5),(92,'Las Flores ',5),(93,'San Luis del Carmen ',5),(94,'San Miguel de Mercedes ',5),(95,'San Rafael Santa ',5),(96,'Rita Tejutla',5),(97,'Aguilares ',6),(98,'Apopa ',6),(99,'Ayutuxtepeque ',6),(100,'Cuscatancingo ',6),(101,'Ciudad Delgado ',6),(102,'El Paisnal ',6),(103,'Guazapa ',6),(104,'Ilopango ',6),(105,'Mejicanos ',6),(106,'Nejapa ',6),(107,'Panchimalco ',6),(108,'Rosario de Mora ',6),(109,'San Marcos ',6),(110,'San Martín S',6),(111,'an Salvador ',6),(112,'Santiago Texacuangos ',6),(113,'Santo Tomás ',6),(114,'Soyapango ',6),(115,'Tonacatepeque',6),(116,'Candelaria ',7),(117,'Cojutepeque ',7),(118,'El Carmen ',7),(119,'El Rosario Monte ',7),(120,'San Juan Oratorio de Concepción ',7),(121,'San Bartolomé Perulapía ',7),(122,'San Cristóbal ',7),(123,'San José Guayabal ',7),(124,'San Pedro Perulapán ',7),(125,'San Rafael Cedros ',7),(126,'San Ramón ',7),(127,'Santa Cruz Analquito ',7),(128,'Santa Cruz ',7),(129,'Michapa ',7),(130,'Suchitoto ',7),(131,'Tenancingo',7),(132,'Cuyultitán ',8),(133,'El Rosario ',8),(134,'Jerusalén ',8),(135,'Mercedes ',8),(136,'La Ceiba ',8),(137,'Olocuilta ',8),(138,'Paraíso de Osorio ',8),(139,'San Antonio Masahuat ',8),(140,'San Emigdio ',8),(141,'San Francisco ',8),(142,'Chinameca ',8),(143,'San Juan Nonualco ',8),(144,'San Juan Talpa ',8),(145,'San Juan Tepezontes ',8),(146,'San Luis Talpa ',8),(147,'San Luis La Herradura ',8),(148,'San Miguel Tepezontes ',8),(149,'San Pedro Masahuat ',8),(150,'San Pedro Nonualco ',8),(151,'San Rafael Obrajuelo ',8),(152,'Santa María Ostuma ',8),(153,'Santiago Nonualco ',8),(154,'Tapalhuaca ',8),(155,'Zacatecoluca',8),(156,'Apastepeque ',9),(157,'Guadalupe ',9),(158,'San Cayetano Istepeque ',9),(159,'San Esteban Catarina ',9),(160,'San Ildefonso ',9),(161,'San Lorenzo ',9),(162,'San Sebastián ',9),(163,'San Vicente ',9),(164,'Santa Clara ',9),(165,'Santo Domingo ',9),(166,'Tecoluca ',9),(167,'Tepetitán ',9),(168,'Verapaz',9),(169,'Alegría ',10),(170,'Berlín ',10),(171,'California ',10),(172,'Concepción Batres ',10),(173,'El Triunfo ',10),(174,'Ereguayquín ',10),(175,'Estanzuelas ',10),(176,'Jiquilisco ',10),(177,'Jucuapa ',10),(178,'Jucuarán ',10),(179,'Mercedes Umaña ',10),(180,'Nueva Granada ',10),(181,'Ozatlán ',10),(182,'Puerto El Triunfo ',10),(183,'San Agustín ',10),(184,'San Buenaventura ',10),(185,'San Dionisio ',10),(186,'San Francisco Javier ',10),(187,'Santa Elena ',10),(188,'Santa María ',10),(189,'Santiago de María ',10),(190,'Tecapán ',10),(191,'Usulután',10),(192,'Carolina ',11),(193,'Chapeltique ',11),(194,'Chinameca ',11),(195,'Chirilagua ',11),(196,'Ciudad Barrios ',11),(197,'Comacarán ',11),(198,'El Tránsito ',11),(199,'Lolotique ',11),(200,'Moncagua ',11),(201,'Nueva Guadalupe ',11),(202,'Nuevo Edén de San Juan ',11),(203,'Quelepa ',11),(204,'San Antonio del Mosco ',11),(205,'San Gerardo ',11),(206,'San Jorge ',11),(207,'San Luis de la Reina ',11),(208,'San Miguel San Rafael Oriente ',11),(209,'Sesori ',11),(210,'Uluazapa',11),(211,'Arambala ',12),(212,'Cacaopera',12),(213,'Chilanga ',12),(214,'Corinto ',12),(215,'Delicias de Concepción ',12),(216,'El Divisadero ',12),(217,'El Rosario ',12),(218,'Gualococti ',12),(219,'Guatajiagua ',12),(220,'Joateca ',12),(221,'Jocoaitique ',12),(222,'Jocoro ',12),(223,'Lolotiquillo ',12),(224,'Meanguera ',12),(225,'Osicala ',12),(226,'Perquín ',12),(227,'San Carlos ',12),(228,'San Fernando ',12),(229,'San Francisco Gotera ',12),(230,'San Isidro ',12),(231,'San Simón ',12),(232,'Sensembra ',12),(233,'Sociedad ',12),(234,'Torola ',12),(235,'Yamabal ',12),(236,'Yoloaiquín',12),(237,'Cinquera ',14),(238,'Dolores ',14),(239,'Guacotecti ',14),(240,'Ilobasco ',14),(241,'Jutiapa ',14),(242,'San Isidro ',14),(243,'Sensuntepeque ',14),(244,'Tejutepeque ',14),(245,'Victoria',14),(246,'Anamorós ',13),(247,'Bolivar ',13),(248,'Concepción de Oriente ',13),(249,'Conchagua ',13),(250,'El Carmen ',13),(251,'El Sauce ',13),(252,'Intipucá ',13),(253,'La Unión ',13),(254,'Lislique ',13),(255,'Meanguera del Golfo ',13),(256,'Nueva Esparta ',13),(257,'Pasaquina ',13),(258,'Polorós ',13),(259,'San Alejo ',13),(260,'San José ',13),(261,'Santa Rosa de Lima ',13),(262,'Yayantique ',13),(263,'Yucuaiquín',13);
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
