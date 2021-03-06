-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 16, 2020 at 11:50 PM
-- Server version: 8.0.18
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

DROP TABLE IF EXISTS `ads`;
CREATE TABLE IF NOT EXISTS `ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `number_of_clicks` int(11) NOT NULL,
  `period_of_view` int(11) NOT NULL,
  `img` varchar(535) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(535) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `owner` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`id`, `position`, `number_of_clicks`, `period_of_view`, `img`, `link`, `owner`) VALUES
(1, 'Top', 0, 60, 'assets/img/uploads/ads/ad12345698778456654546.png', 'http://www.paltel.ps', 'الاتصالات');

-- --------------------------------------------------------

--
-- Table structure for table `adsposition`
--

DROP TABLE IF EXISTS `adsposition`;
CREATE TABLE IF NOT EXISTS `adsposition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `adsposition`
--

INSERT INTO `adsposition` (`id`, `position`) VALUES
(1, 'Top'),
(2, 'Left'),
(3, 'Right'),
(4, 'Bottom');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id` int(30) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`name`, `id`) VALUES
('أهم الأخبار', 1),
('عالمي وعربي', 11),
('ترفيه', 3),
('منوعات وفن', 4),
('صحة', 5);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `newsId` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `newsId`, `name`, `email`, `content`, `date`) VALUES
(20, 10, 'علي', 'ali@ali.com', 'مقال جميل', '2020-05-09 04:18:43'),
(21, 10, 'Suhair ', 'ali@ali.com', 'احببته', '2020-05-09 04:19:01'),
(22, 7, 'suhair', 'sadsdasadsadsad@dsfadafdsf.com', 'ما هذا!', '2020-05-09 04:19:28');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `author_id` int(20) DEFAULT NULL,
  `date` datetime NOT NULL,
  `feature` tinyint(1) NOT NULL,
  `approve` tinyint(1) NOT NULL,
  `category` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `views` int(11) NOT NULL,
  `comments` int(11) NOT NULL,
  `img` varchar(535) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `thumbnail` varchar(535) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `content`, `author_id`, `date`, `feature`, `approve`, `category`, `views`, `comments`, `img`, `thumbnail`) VALUES
(1, 'غوتيريش: أتابع بقلق أوضاع أسرى فلسطين بظل كورونا', 'شاشة نيوز: قال أمين عام الأمم المتحدة أنطونيو غوتيريش إنه طلب من منسقه الخاص لعملية التسوية في الشرق الأوسط نيكولاي ملادينوف البقاء في حالة اتصال مع المسؤولين الإسرائيليين لضمان احترام حقوق المعتقلين الفلسطينيين في السجون الإسرائيلية وحمايتها.\r\n\r\nجاء ذلك في رسالة رسمية وجهها غوتيريش إلى أمين سر اللجنة التنفيذية لمنظمة التحرير صائب عريقات ردًأ على رسالته له بتاريخ 30 آذار الماضي، من أجل التحرك العاجل لإنقاذ حياة الأسرى وضمان حمايتهم في ظل تهديد تفشي \"كوفيد 19\" داخل سجون الاحتلال.\r\n\r\nونبه غوتيريش إلى الخطر الذي يشكله الفيروس على الفئات الضعيفة من السكان، بمن في ذلك المعتقلون، كونهم أكثر عرضة لخطر الإصابة.\r\n\r\nوأضاف غوتيريش \"أتابع باهتمام وقلق بالغين وضع المعتقلين الفلسطينيين في السجون الإسرائيلية والقضايا الخطيرة التي أثرتها برسالتك\".\r\n\r\nوشدد على أنه يتوجب على جميع الحكومات الإيفاء بالتزاماتها القانونية والعمل بشكل حاسم لحماية المسؤولين عنهم، مشيرًا إلى نداء المفوضة السامية لحقوق الإنسان، ميشيل باشيليت، في 25 آذار التي دعت فيه الدول إلى العمل من أجل منع التهديدات المتوقعة للصحة العامة وضمان حصول جميع المحتاجين على الرعاية الطبية.\r\n\r\nولفت غوتيريش إلى الطرق التي من شأنها حماية المعتقلين في هذه الأوقات، بما فيها الحد من عدد المعتقلين من أجل تحسين الظروف الصحية العامة، والحد من الاكتظاظ داخل السجن، والإبقاء على فرض القيود على الزيارات العائلية القائمة على أساس طبي وصحي، وربط المعتقلين بعائلاتهم من خلال الفيديو على سبيل المثال.\r\n\r\nوشدد على ضرورة إجراء اختبار كوفيد 19 على المعتقلين المرضى، وعزلهم عن باقي المعتقلين الآخرين، واتخاذ التدابير اللازمة لضمان عدم تعريض المعتقلين لخطر العدوى من خلال الأشخاص الذين يتواصلون معهم مثل الحراس والمحامين.', 1, '2020-04-01 00:00:00', 0, 0, 'ترفيه', 3, 0, 'assets/img/uploads/1.jpg', 'assets/img/uploads/thumbnails/1.jpg'),
(3, 'أبو بكر: الاحتلال يماطل في الاجراءات الوقائية للاس', 'شاشة نيوز -أعرب رئيس هيئة شؤون الأسرى والمحررين الوزير قدري أبو بكر عن قلقه من مماطلة وتأخر الاحتلال الإسرائيلي في تنفيذ توصيات منظمة الصحة العالمية بشأن التباعد الاجتماعي بين الأسرى، وتأخره في تسليم الكمامات وتعقيم السجون، بسبب فيروس \"كورونا\".\r\n\r\nوأكد أبو بكر، خلال لقاء نظمته وزارة الإعلام الكترونيا، اليوم السبت، أنه لا إصابات في صفوف الأسرى، بفيروس \"كورونا\".\r\n\r\nوقال إن دولة الاحتلال بدأت منذ أيام بتعقيم المعتقلات رغم مرور شهر ونصف على انتشار الوباء، فيما بدأت بتسليم الأسرى الكمامات قبل يومين فقط، وما تزال تمنع دخول المبالغ التي يحولها الأهل إلى أبنائهم الأسرى للشهر الثاني على التوالي، أي منذ انتشار \"كورونا\".\r\n\r\nوأضاف أن هذه الإجراءات تتزامن مع سحب 40% من مواد الكانتينا، 10% منها من منتجات الألبان والأجبان، معتبرا أن إيقاف المحاكمات وتنقلات الأسرى بين الأقسام والسجون- وهي قرارات فرضها الأسرى بكل الطرق الممكنة وصولا إلى قيام الأسير أيمن الشرباتي بإحراق غرفة الشرطة احتجاجا- لا تكفي في ظل الخطر الأكبر المتمثل بالاكتظاظ الشديد داخل غرف الأسرى، موضحا أن ما بين 8-10 أسرى يتوزعون على 16 مترا مربعا تقريبا، بالإضافة إلى تقليص عدد الممرضين الإسرائيليين في الأقسام إلى واحد بدل اثنين، منذ بداية الأزمة.\r\n\r\nوأعرب أبو بكر عن قلقه الشديد من قانون منع الإفراج المبكر عن الأسرى، الذي كان أقره الكنيست الإسرائيلي بطلب من أحزاب إسرائيلية متطرفة، والذي أدى في وقت سابق إلى استشهاد عدد من المرضى الأسرى منهم سامي أبو دياك وناجح السائح، وانضمام جثمانيهما إلى ما مجموعه 300 جثمان محتجز، إضافة لعدم توفير العناية الطبية للأسرى، ما يهدد بكارثة إذا ما انتقل الوباء إلى المعتقلات.\r\n\r\n وأشار أبو بكر إلى أن هيئة شؤون الأسرى والمحررين تواصلت منذ بداية أزمة \"كورونا\" مع منظمة الصحة العالمية، التي أعلنت عن توجيهها رسالة لإسرائيل تحملها فيها المسؤولية عن حياة أي أسير فلسطيني بسبب \"كورونا\"، كما أنها على تواصل دائم مع الصليب الأحمر للحصول على معلومات كاملة عن الأسرى، لا سيما الأسير أيمن الشرباتي.\r\n\r\nوجدد أبو بكر تحميل الاحتلال الإسرائيلي المسؤولية الكاملة عن حياة الأسرى، البالغ عددهم خمسة آلاف أسير، منهم 700 من الأسرى المرضى، و40 أسيرة، و430 أسيرا إداريا، و540 من الأسرى المحكومين بالسجن المؤبد، موزعين على 23 معتقلا.', 2, '2020-04-02 00:00:00', 0, 1, 'أهم الأخبار', 4, 0, 'assets/img/uploads/3.jpg', 'assets/img/uploads/thumbnails/3.jpg'),
(6, 'علامات رئيسية على إصابة طفلك بفيروس كورونا', 'شاشة نيوز: على الرغم من أن الأدلة والإحصائيات تشير إلى أن عدد الأطفال الذين أصيبوا بفيروس كورونا قليل جداً حتى الآن، إلا أن هذا لا يعني بأن الخطر بعيد عنهم بشكل كامل.\r\n\r\nوقد يواجه الكثير من الآباء صعوبة في معرفة ما إذا كان أطفالهم مصابين بنزلة برد أو بالفيروس التاجي القاتل، إذ تشمل العلامات الرئيسية لعدوى كورونا لدى الأطفال السعال المستمر وارتفاع درجة حرارة الجسم وصعوبة التنفس، والتي تشبه أعراض الكثير من الأمراض الشائعة الأخرى.\r\n\r\nوبحسب الخبراء فإن الطريقة الوحيدة التي يمكن للوالدين التأكد فيما إذا كان طفلهما مصاباً بفيروس كورونا هي خضوعه للاختبار الطبي.\r\n\r\nوينصح الخبراء بعدم اصطحاب الطفل إلى طبيب خاص أو صيدلاني، إذا شك الوالدان بإصابة طفلهما بالفيروس، وإبقائه في المنزل واستخدام خدمة الاستشارة عبر الإنترنت للحصول على استشارة طبية عاجلة. وإن لم تكن الاستشارة دقيقة يُنصح باصطحاب الطفل إلى المستشفى لإجراء الفحوصات اللازمة.\r\n\r\nوبحسب صحيفة ميرور أونلاين، فقد حددت الكلية الملكية البريطانية لطب الأطفال، الأعراض التي تستوجب التصرف بشكل سريع ونقل الطفل إلى المستشفى على الفور، على النحو التالي:\r\n\r\nالشحوب، والشعور بالقشعريرة عند ملامسته، والتنفس بشكل غير منتظم والشخير، والصعوبة في التنفس، وازرقاق حول الشفتين، إضافة إلى الطفح الجلدي، وآلام في الخصيتين للذكور، والشعور بالخمول.', 1, '2020-04-18 07:34:47', 0, 1, 'صحة', 2, 0, 'assets/img/uploads/6.jpg', 'assets/img/uploads/thumbnails/6.jpg'),
(7, 'ترامب: أمور غريبة كثيرة تحدث بخصوص كورونا!', 'شاشة نيوز: قال الرئيس الأمريكي دونالد ترامب إن \"أمورا غريبة كثيرة تحدث\" فيما يتعلق بأصل فيروس كورونا المستجد.\r\n\r\nوأضاف ترامب أمس الجمعة للصحفيين في البيت الأبيض: \"أمور غريبة كثيرة بدأت تحدث ولكن تحقيقات كثيرة تجري، وسنكتشف ذلك\".\r\n\r\nوأشار إلى أن أشخاصا كثيرين لا بد وأن يكونوا قد توفوا في الصين أكثر من الولايات المتحدة، التي أعلنت أكبر عدد من حالات الوفاة في العالم نتيجة هذا الفيروس.\r\n\r\nوتابع: \"ليس لدينا أكبر عدد من حالات الوفاة في العالم. أكبر عدد في العالم لا بد وأن يكون في الصين. إنها دولة ضخمة. وهي تمر بمشكلة ضخمة في هذا الشأن، لابد وأن يكون لديهم أعلى عدد\".\r\n\r\nمن جهتها، قالت الصين إنه لم يتم ضم 1300 شخص توفوا بفيروس كورونا في مدينة ووهان إلى العدد الإجمالي للوفيات . ويمثل هذا العدد نصف إجمالي عدد الوفيات. ولكن الصين رفضت ادعاءات بالتستر على الأعداد الحقيقية.\r\n\r\nويعد مصدر الفيروس لغزا. ويشير الإجماع العلمي الواسع إلى أن فيروس كورونا بدأ أصلا في الخفافيش.\r\n\r\nوذكرت محطة \"فوكس نيوز\" يوم الأربعاء أن الفيروس بدأ في مختبر بمدينة ووهان في إطار جهود الصين لإظهار كفاءة جهودها لتحديد ومكافحة الفيروسات .\r\n\r\nوأعلنت الصين عن 4632 حالة وفاة جراء الوباء داخل حدودها. وطبقا لحصيلة لوكالة \"رويترز\" فقد تجاوز عدد حالات الوفاة في الولايات المتحدة 35400 حالة لغاية يوم الجمعة.\r\n\r\nوحدثت مرارا خلافات علنية بين واشنطن وبكين بشأن الفيروس. وأشاد ترامب في بادئ الأمر برد الصين على الفيروس، ولكنه وكبار مساعديه أشاروا أيضا إليه بوصفه \"الفيروس الصيني\"، وهذا ما ترفضه بكين.', 1, '2020-04-09 06:50:24', 0, 1, 'عالمي وعربي', 21, 1, 'assets/img/uploads/7.jpg', 'assets/img/uploads/thumbnails/7.jpg'),
(8, 'أطعمة تحمي من نزيف اللثة .. تعرف عليها', 'شاشة نيوز: يحدث نزيف اللثة نتيجة التهابات في الفم، ولا يجب الاستهانة بهذه المشكلة لأن مضاعفاتها كبيرة على صحة الأسنان. وفي ظل العزل بسبب فيروس كورونا يمكنك تخفيف هذا النزيف وعلاجه من خلال الغرغرة بالماء والملح، مع تناول الأطعمة التي تعيد لخلايا اللثة صحتها وتقضي على الالتهابات، وهي حسب توصيات مايو كلينيك.\r\n\r\n* الفواكه الحمضية كالبرتقال واليوسفي والجريب فروت، والخضروات الغنية بفيتامين \"سي\" والمضادات الحيوية النباتية مثل البروكلي والملفوف (الكرنب).\r\n\r\n* المشمش من الفواكه التي تبين أنها تعالج نزيف اللثة لأنه غني بفيتامين \"سي\" و\"أ\". وتشترك مع في نفس التركيبة أيضاً البطاطا الحلوة والجزر.\r\n\r\n* الحليب مصدر رائع للكالسيوم وفيتامين \"أ\"، وهو غني بالمغذيات التي تقوي اللثة.\r\n\r\n* الخيار طعام يحافظ على التوازن الحمضي داخل الفم، وهو ما يساعد على شفاء نزيف اللثة بسرعة.\r\n\r\n* الخضروات النيئة التي يحتوي عليها طبق السلطة من الأطعمة التي تسرع شفاء نزيف اللثة.', 2, '2020-04-08 00:25:45', 0, 1, 'صحة', 31, 0, 'assets/img/uploads/8.jpg', 'assets/img/uploads/thumbnails/8.jpg'),
(9, 'أيهما أفضل المناديل الورقية أم أجهزة التجفيف للتخل', 'شاشة نيوز: أظهرت دراسة جديدة في بريطانيا، أن المناديل الورقية أفضل من أجهزة التجفيف بالهواء لإزالة الفيروسات وأهمها كورونا الجديد.\r\n\r\nوتقول الدراسة، إن الذين لا يغسلون أيديهم بشكل صحيح، يمكنهم استخدام المناديل الورقية الكثر فعالية من جهاز التجفيف بالهواء لإزالة الجراثيم والفيروسات العالقة في أيديهم.\r\n\r\nوحسب العلماء فإن تجفيف اليدين لا يقل أهمية عن غسلها لتقليل انتشار الميكروبات الخطيرة، بما فيها كورونا، إذ يؤدي الفشل في إزالتها إلى زيادة احتمال انتقالها إلى الأسطح الأخرى وانتشارها وتمريرها إلى آخرين.\r\n\r\nونظرت الدراسة الجديدة، في تجفيف اليدين بعد استخدام دورات المياه العامة، وانتقال الفيروس في المستشفيات.\r\n\r\nوفي هذا البحث، لوث أربعة متطوعين أيديهم بعثّ البكتريا، وهو فيروس يصيب البكتريا ولا يضر بالإنسان. وغسل متطوعان ما بأيديهما بسرعة واستخدما المناديل الورقية في دورة مياه أحد المستشفيات، في حين جفف الآخران أيديهما بمجفف الهواء.\r\n\r\nوارتدى المتطوعون مئزر لقياس مستوى التلوث في الملابس أثناء تجفيف اليدين. ومن ثم اختبر العلماء الأسطح التي لامسها المتطوعون بعد غسل أيديهم وتجفيفها، بما فيها الأبواب والسلالم وأزرار المصعد والهواتف والكراسي.\r\n\r\nوكشفت النتائج أن الأسطح التي لامسها الذين استخدموا المناديل الورقية لتجفيف أيديهم، كانت أقل تلوثاً، مقارنة مع الذين استخدموا التجفيف الهوائي، وكان متوسط تلوث الأسطح أعلى بعشر مرات.\r\n\r\nوأظهرت النتائج أن الفيروسات انتقلت من المئزر إلى الكراسي من الذين استخدموا جهاز التجفيف الهوائي، ما يشير إلى أن نقل الميكروبات إلى الأسطح لا يكون فقط باليدين، ولكنه ممكن بالملابس أيضاً.\r\n\r\nونشرت نتائج الدراسة من قبل المؤتمر الأوروبي لعلم الأحياء الدقيقة السريرية والأمراض المعدية، وفق صحيفة ميرور أونلاين. ', 1, '2020-04-07 19:32:00', 0, 1, 'صحة', 35, 0, 'assets/img/uploads/9.jpg', 'assets/img/uploads/thumbnails/9.jpg'),
(10, 'نتائج مشجعة لعقار تجريبي أمريكي ضد كورونا', 'شاشة نيوز: قفزت أسم شركة جيلياد ساينسيز للأدوية 16 بالمئة بعد إغلاق السوق بعد تقرير إعلامي أورد بيانات جزئية مشجعة من تجارب لعقار ريمديسيفير التجريبي للشركة الأمريكية على مصابين بحالات حادة من كورونا.\r\n\r\nوقال موقع \"ستات\" الإخباري الطبي على الانترنت إن مستشفى تابعاً لجامعة شيكاغو يشارك في دراسة عن الدواء المضاء للفيروسات، قال إنه يرصد تعافياً سريعاً من أعراض الحمى، والجهاز التنفسي، وأن جميع المصابين  تقريباً غادروا المستشفى بعد أقل من أسبوع.\r\n\r\nوقالت جيلياد في بيان بالبريد الإلكتروني إن \"شمول البيانات في حاجة إلى تحليل لاستخلاص أي نتائج من التجربة\".\r\n\r\nوقال مستشفى يو شيكاغو ميديسن في رسالة بالبريد الإلكتروني أيضاً، إن \"البيانات الجزئية من تجربة سريرية مستمرة هي بالأساس غير مكتملة ولا يجب استخدامها لاستخلاص نتائج\".\r\n\r\nوتتوقع جيلياد نتائج من المرحلة الثالثة من الدراسة على مصابين بحالات حادة من كورونا في نهاية الشهر، وتوفر بيانات إضافية من دراسات أخرى في مايو (أيار).\r\n\r\nولا يوجد حتى الآن دواء معتمد لكورونا، لذي أصاب أكثر من مليوني شخص في أنحاء العالم.\r\n\r\nوذكر موقع ستات، أن مستشفى يو شيكاغو ميديسن، استعان بـ113 متطوعاً مصابين بحالات حادة من كورونا في تجربة جيلياد. وأضاف أن معظمهم غادروا المستشفى، وتوفي مريضان.\r\n\r\nوزاد الاهتمام بقوة بعقار جيلياد التجريبي في ظل جائحة كورونا.\r\n\r\nوأظهر تحليل لنشرة نيو إنغلاند جورنال أوف ميديسن، في الأسبوع الماضي أن نسبة الثلثين من مجموعة صغيرة من المصابين بحالات حادة من كورونا، شهدوا تحسن حالتهم بعد علاجهم بعقار ريمديسيفير.\r\n\r\nوقفز سهم جيلياد، الذي أغلق عند 76.54 دولاراً، بـ 16% إلى 89.1 دولاراً بعد ساعات التداول الرسمي.', 2, '2020-04-18 11:39:19', 1, 1, 'صحة', 11, 2, 'assets/img/uploads/10.jpg', 'assets/img/uploads/thumbnails/10.jpg'),
(15, 'سلطة النقد: حقوق أسر الأسرى محفوظة لدى البنوك والت', 'شاشة نيوز - أكدت سلطة النقد أن حقوق أسر الأسرى والمحررين محفوظة لدى البنوك، وأنها ستنسق مع الحكومة حول ضمان استمرارية تلقيهم لمستحقاتهم.\r\n\r\nجاء ذلك في بيان أصدرته مساء اليوم الجمعة، شددت خلاله على أن اللجنة المشكلة بقرار من رئيس الوزراء باشرت العمل على تحليل المخاطر التي تلحق بمستحقات ذوي الأسرى وانعكاسات الأمر العسكري الإسرائيلي على البنوك العاملة.\r\n\r\nوبينت أنها تتابع مبادرة بعض البنوك بإغلاق الحسابات تجنبا لتبعات تهديد سلطات الاحتلال. وأكدت أن هذه الاجراءات تمت بدون التقيد بقوانينها وتعليماتها التي توجب إعلامها بشكل مسبق، وأنها ستعالج هذا الأمر.\r\n\r\nواستنكرت \"الاعتداءات غير المسؤولة على فروع البنوك والهجمة غير المبررة عليها\"، مؤكدة وقوفها لحماية الجهاز المصرفي.\r\n\r\nوشددت سلطة النقد على انها لن تتخلى عن دورها في حماية أموال المودعين جميعا، وفي إدارة ملف حسابات ذوي الأسرى. وطالبت بالتعامل بحكمة بالغة وبشكل يضمن عدم إقدام الاحتلال على مصادرة أموال من البنوك كما حدث سابقا عام 2004.', 1, '2020-05-12 18:32:37', 0, 1, 'أهم الأخبار', 2, 0, 'assets/img/uploads/5ebac195510147.36559815.jpg', 'assets/img/uploads/thumbnails/5ebac195510147.36559815.jpg'),
(16, 'تسجيل 10 إصابات جديدة بكورونا في الأردن', 'شاشة نيوز - أعلنت وزارة الصحة الاردنية اليوم الجمعة، تسجيل 10 إصابات جديدة بفيروس كورونا المستجد، ليرتفع عدد الإصابات الإجمالي إلى 596 حالة.\r\n\r\nوأضافت الصحة الأردنية في موجز إعلامي حول فيروس كورونا المستجد، أن الحالات توزعت: 6 حالات لمخالطي مخالطي سائق الشاحنة في منطقة الخناصري، (منها 3 حالات في محافظة الزرقاء، وحالتان في محافظة إربد، وحالة واحدة في محافظة المفرق)، و 4 حالات إصابة لسائقي شاحنات قادمين عبر حدود العمري، منهم 2 أردنيّان، و2 من جنسيّة عربيّة تمّ التعامل معهما وفق البروتوكول المتّبع\".\r\n\r\nوسجّلت 8 حالات شفاء في مستشفى الأمير حمزة، وبذلك يبلغ عدد الحالات قيد العلاج 131 حالة.\r\n\r\nوأشارت إلى أنه تمّ \"اليوم إجراء قرابة 4500 فحص مخبري، ليصبح إجمالي عدد الفحوصات التي أجريت حتى الآن 136229 فحصاً.', 1, '2020-05-15 23:34:22', 0, 1, 'أهم الأخبار', 2, 0, 'assets/img/uploads/5ebefd8db6c8c7.37107538.jpg', 'assets/img/uploads/thumbnails/5ebefd8db6c8c7.37107538.jpg'),
(18, 'الفيروس التاجي وسر خطورته الشديدة على المصابين بال', 'شاشة نيوز أفاد كبير الأطباء الروس في أمراض الكلى المزمنة، البروفيسور يفغيني شيلوف، بأن المصابين بأمراض الكلى المزمنة، هم من الفئة الاكثر عُرضة للإصابة بالفيروس التاجي والوفاة منه.\r\n\r\nونقل المكتب الإعلامي لوزارة الصحة الروسية عن كبير الأطباء قوله: \"يرجع ذلك إلى حقيقة أن مرض الكلى المزمن ناجم عن الأمراض الشائعة الرئيسة مثل السكري وارتفاع ضغط الدم والسمنة وتصلب الشرايين، وكذلك الشيخوخة، والتي تسهم بذاتها في ارتفاع معدلات الاعتلال والوفيات بسبب كوفيد – 19\".\r\n\r\nويواجه المصابون بأمراض الكلى المزمنة الذين يخضعون لغسيل الكلى، الصعوبات الأكبر في تنظيم الوقاية من \"كوفيد – 19\"، وذلك لاستحالة وقف مثل هذا النوع من العلاج.\r\n\r\nويعاني جزء كبير من هؤلاء المرضى إضافة إلى ذلك، من ضعف في الجسم، ومستوى أعلى من الأمراض المصاحبة.\r\n\r\nكما ينتمي المرضى الذين يعانون من غسيل الكلى، بشكل عام، إلى الفئة العمرية الأكبر سنا وهم عرضة للأمراض المعدية الشديدة.\r\n\r\nولفت كبير الأطباء الروسي في أمراض الكلى المزمنة إلى أن ما بين 20-30% من مرضى \"كوفيد – 19\" يعانون من الفشل الكلوي، ما يزيد من الحاجة إلى غسيل الكلى.\r\n\r\nوخاطب شيلوف أفراد هذه الفئة قائلا: \"إذا كنت ممن يترددون على مركز غسيل الكلى، فأخبر قسمك أنك مريض بالفيروس التاجي. إذا كنت مريضا يعاني من الفشل الكلوي في المرحلة النهائية من غسيل الكلى، فأنت معرض لخطر الإصابة بعدوى الفيروس التاجي الحادة، ويجب عليك القيام بما يلي: اجمع كل ما تحتاجه، بما في ذلك الأدوية\".\r\n\r\nويوصى كبير الأطباء الروس أيضا أصحاب هذه الفئة بأنه حتى لو أصيبوا بعدوى الفيروس التاجي، فلا يجب عليهم تخطي إجراءات غسيل الكلى، ومن الضروري إخطار الأطباء بالمرض، وبدورهم سيتخذون الإجراءات اللازمة لتنفيذ عمليات الغسيل، وكذلك توخي غسل منتصف الذراع قبل الغسيل الكلوي، وتعقيم منطقة الثقب بشكل تام.', 1, '2020-05-15 23:45:11', 0, 0, 'صحة', 0, 0, 'assets/img/uploads/5ebeff56021d86.35967470.jpg', 'assets/img/uploads/thumbnails/5ebeff56021d86.35967470.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `rolls`
--

DROP TABLE IF EXISTS `rolls`;
CREATE TABLE IF NOT EXISTS `rolls` (
  `id` int(11) NOT NULL,
  `roll` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roll` (`roll`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rolls`
--

INSERT INTO `rolls` (`id`, `roll`) VALUES
(1, 'admin'),
(2, 'author'),
(3, 'editor');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(200) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `roll` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `birthdate` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `name`, `roll`, `birthdate`) VALUES
(1, 'admin', 'admin', 'admin@admin.com', 'Admin', 'admin', '1999-08-02'),
(2, 'user1', '123', 'user1@users.com', 'user1', 'author', '0000-00-00'),
(3, 'editor1', '123', 'editor1@editor.com', 'ahmad', 'editor', '1988-04-29'),
(111, 'undefined', '0000', 'undefined@admin.com', 'undefined', 'author', '2020-05-05');

-- --------------------------------------------------------

--
-- Table structure for table `website`
--

DROP TABLE IF EXISTS `website`;
CREATE TABLE IF NOT EXISTS `website` (
  `views` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
