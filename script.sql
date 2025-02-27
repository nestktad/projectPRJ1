USE [master]
GO
/****** Object:  Database [PRJ301]    Script Date: 12/14/2023 10:38:36 AM ******/
CREATE DATABASE [PRJ301]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRJ301', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER02\MSSQL\DATA\PRJ301.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRJ301_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER02\MSSQL\DATA\PRJ301_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PRJ301] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRJ301].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRJ301] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRJ301] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRJ301] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRJ301] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRJ301] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRJ301] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRJ301] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRJ301] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRJ301] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRJ301] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRJ301] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRJ301] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRJ301] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRJ301] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRJ301] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PRJ301] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRJ301] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRJ301] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRJ301] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRJ301] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRJ301] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRJ301] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRJ301] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PRJ301] SET  MULTI_USER 
GO
ALTER DATABASE [PRJ301] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRJ301] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRJ301] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRJ301] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRJ301] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRJ301] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PRJ301', N'ON'
GO
ALTER DATABASE [PRJ301] SET QUERY_STORE = OFF
GO
USE [PRJ301]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/14/2023 10:38:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[pass] [nvarchar](50) NOT NULL,
	[role] [int] NOT NULL,
	[phone] [int] NULL,
	[address] [nvarchar](max) NULL,
	[avatar] [nvarchar](max) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 12/14/2023 10:38:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[bid] [int] IDENTITY(1,1) NOT NULL,
	[cid] [nvarchar](50) NOT NULL,
	[bname] [nvarchar](250) NOT NULL,
	[author] [nvarchar](250) NOT NULL,
	[image] [nvarchar](max) NULL,
	[pid] [nvarchar](50) NOT NULL,
	[quantity] [int] NULL,
	[describe] [nvarchar](max) NULL,
	[price] [float] NOT NULL,
 CONSTRAINT [PK__Book_HE1__3DE0C2271D91BD49] PRIMARY KEY CLUSTERED 
(
	[bid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/14/2023 10:38:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [nvarchar](50) NOT NULL,
	[cname] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 12/14/2023 10:38:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[oid] [int] IDENTITY(1,1) NOT NULL,
	[aid] [int] NOT NULL,
	[date] [date] NOT NULL,
	[total] [float] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 12/14/2023 10:38:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[oid] [int] NOT NULL,
	[bid] [int] NOT NULL,
	[quanity] [int] NOT NULL,
	[price] [float] NOT NULL,
	[total] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publisher]    Script Date: 12/14/2023 10:38:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publisher](
	[pid] [nvarchar](50) NOT NULL,
	[pname] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [username], [email], [pass], [role], [phone], [address], [avatar]) VALUES (1, N'Linh', N'duclinh@gmail.com', N'123', 1, 123456789, N'Ha Noi', N'https://haycafe.vn/wp-content/uploads/2021/11/Anh-avatar-dep-chat-lam-hinh-dai-dien.jpg')
INSERT [dbo].[Account] ([id], [username], [email], [pass], [role], [phone], [address], [avatar]) VALUES (3, N'test3', N'test@newsvine.com', N'123', 0, 123456789, N'ha tinh ', N'https://khoinguonsangtao.vn/wp-content/uploads/2022/07/avatar-cute-2.jpg')
INSERT [dbo].[Account] ([id], [username], [email], [pass], [role], [phone], [address], [avatar]) VALUES (12, N'Minh', N'minh@gmail.com', N'123', 1, 123456789, N'ha tay', NULL)
INSERT [dbo].[Account] ([id], [username], [email], [pass], [role], [phone], [address], [avatar]) VALUES (22, N'dat', N'datnbhe176137@gmail.com', N'123', 1, 123456789, N'ha noi', NULL)
INSERT [dbo].[Account] ([id], [username], [email], [pass], [role], [phone], [address], [avatar]) VALUES (24, N'Minh', N',minh@123', N'123', 0, NULL, NULL, N'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/599e3b95636919.5eb96c0445ea7.jpg')
INSERT [dbo].[Account] ([id], [username], [email], [pass], [role], [phone], [address], [avatar]) VALUES (25, N'test', N'tester@123', N'123', 1, 0, N'', NULL)
INSERT [dbo].[Account] ([id], [username], [email], [pass], [role], [phone], [address], [avatar]) VALUES (26, N'admin', N'admin@gmail.com', N'123', 0, 841234567, N'ha noi', NULL)
INSERT [dbo].[Account] ([id], [username], [email], [pass], [role], [phone], [address], [avatar]) VALUES (28, N'minh', N'minh@1234', N'123', 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([bid], [cid], [bname], [author], [image], [pid], [quantity], [describe], [price]) VALUES (2, N'2', N'Triết Lý Kinh Doanh', N'Inamori Kazuo', N'https://static-shop.waka.vn/resize/340x497x2/image/img.product/0/0/0/38/19831_1.jpg', N'3', 7421, N'Một trong những lý do hẳn là sự tái sinh đầy ngoạn mục của JAL. Từ tình trạng nợ nần chồng chất và việc kinh doanh đang trên bờ phá sản, sau khi được ngài Inamori lãnh đạo và dẫn dắt trong vòng 2 năm 8 tháng, JAL đã có thể hoạt động trở lại. Khả năng phi thường đó đã được truyền đi rộng rãi khắp nước Nhật và khiến số lượng doanh nhân muốn học tập “phong cách kinh doanh Inamori” tăng vọt.Hiện nay, Nhật Bản đang bước vào thời kì chuyển đổi vô cùng mạnh mẽ. Dân số giảm, dân số bị già hoá; quá trình toàn cầu hoá kinh doanh đang bước vào giai đoạn phát triển như vũ bão. Bởi vậy, vai trò của chính trị đối với quản lý đất nước cũng dần thay đổi. Có rất nhiều người gật đầu đồng ý với quan điểm Nhật Bản phải thay đổi, nhưng câu hỏi “Làm thế nào để thay đổi?” vẫn chưa được trả lời.Khi lúng túng, phân vân không biết xử lý một việc gì đó như thế nào, có một nguyên tắc bất di bất dịch là hãy quay trở về điểm xuất phát. Quốc gia là gì? Kinh doanh là gì? Chính trị là gì? Doanh nghiệp là gì?Chúng tôi nghĩ rằng ở thời đại này, có lẽ chẳng có ai đưa ra những câu hỏi mang tính gốc rễ, căn nguyên giống như vậy. Câu hỏi tuyệt đối không được phép quên là “Bản chất của doanh nhân là gì?”Sứ mệnh của doanh nhân rốt cuộc là gì? Là tăng lợi nhuận? Khiến cho việc kinh doanh của công ty kéo dài mãi mãi? Đương nhiên, đây đều là những mục tiêu quan trọng mà bất cứ ai làm kinh doanh đều hướng đến, cũng có thể nói đó là sứ mệnh của cả công ty. Chúng tôi muốn thử tìm kiếm câu trả lời cho câu hỏi đó với tư cách là một doanh nhân và muốn đổi câu hỏi “Doanh nhân là gì?” thành “Nếu là một doanh nhân thì nên là một con người như thế nào?”“Phương pháp luận về người lãnh đạo cao nhất” của ngài Inamori đã thay đổi bản chất của doanh nhân, từ đó phát triển doanh nghiệp. Những doanh nhân tham gia khoá học Morikazu đã có trải nghiệm như vậy cho chính mình: vừa tự cổ vũ bản thân, vừa thử “nỗ lực không thua kém bất kỳ ai” theo lời ngài Inamori. Nỗ lực phấn đấu từng ngày và chiến đấu với chính bản thân mình của họ khiến chúng tôi thực sự xúc động mỗi lần nhớ lại. Chúng tôi muốn mang lại một làn gió mới, mạnh mẽ, quyết liệt cho những doanh nghiệp vừa và nhỏ đang ngày đêm cố gắng bằng cách mang đến cho họ câu trả lời cho câu hỏi “Doanh nhân là gì?” thông qua cuốn sách nàyChương I nói về những đóng góp của ngài Inamori, chương II kể về câu chuyện của bảy người học trò của ngài và ở chương III, chúng tôi sẽ gửi gắm tới bạn đọc suy nghĩ của mình về câu hỏi “Doanh nhân là gì?” Mong rằng sau khi đọc cuốn sách này, độc giả sẽ ý thức được “Doanh nhân là gì?” một cách sâu sắc hơn và tự trang bị cho mình những kỹ năng để trở thành một doanh nhân tài giỏi.', 160000)
INSERT [dbo].[Book] ([bid], [cid], [bname], [author], [image], [pid], [quantity], [describe], [price]) VALUES (3, N'2', N'Đất Rừng Phương Nam (Tái Bản)', N'Đoàn Giỏi', N'images\datrungphuongnam.jpg', N'2', 9999, N'Cuộc đời lưu lạc của chú bé An qua những miền đất rừng phương Nam thời kì đầu cuộc kháng chiến chống Pháp. Một vùng đất trù phú, đa dạng, kì vĩ với những kênh rạch, tôm cá, chim chóc, muông thú, lúa gạo... và cây cối, rừng già. Trong thế giới đó có những con người vô cùng nhân hậu như cha mẹ nuôi của bé An, như cậu bé Cò, chú Võ Tòng... cùng những người anh em giàu lòng yêu quê hương, đất nước. Cuộc sống tự do và cuộc đời phóng khoáng cởi mở đã để lại ấn tượng sâu sắc trong tâm khảm người đọc nhiều thế hệ suốt những năm tháng qua

Bạn đang nắm trong tay cơ hội để đúc kết thật nhiều những bài học khôn ngoan từ những trang sách này, bởi vì bạn chuẩn bị học hỏi từ một người đàn ông “nói là làm”. Và bạn có muốn bỏ lỡ cơ hội này không?', 162000)
INSERT [dbo].[Book] ([bid], [cid], [bname], [author], [image], [pid], [quantity], [describe], [price]) VALUES (4, N'2', N'Dám Nghĩ Lại', N'Adam Grant', N'images\damnghilai.jpg', N'2', 9999, N'Vòng đời sản phẩm tinh gọn - Cuốn sách dành cho những “kẻ thay đổi cuộc chơi”

Trong bối cảnh thế giới đang thay đổi từng ngày, mỗi công ty phải có khả năng đổi mới sáng tạo và duy trì tăng trưởng để giữ vững lợi thế cạnh tranh. Vòng đời sản phẩm tinh gọn là cuốn sách dành cho những “kẻ thay đổi cuộc chơi” – những người muốn kiến tạo hành trình đổi mới và tăng trưởng bền vững. Những kẻ thay đổi cuộc chơi này có thể là bất kỳ ai: công nhân, giám đốc sản phẩm (product manager), chủ sở hữu sản phẩm (product owner), nhà thiết kế, kỹ sư phần mềm, giám đốc đổi mới, giám đốc công nghệ số, giám đốc marketing và kinh doanh, giám đốc tài chính, quản lý cấp cao và những người nằm trong ban điều hành.

Vòng đời sản phẩm tinh gọn là một cuốn sách cung cấp các phương pháp và công cụ để phát triển các sản phẩm và mô hình kinh doanh mới sáng tạo trong khi quản lý danh mục đầu tư cốt lõi của bạn. Thực hiện theo 6 giai đoạn chính của vòng đời sản phẩm: Ý tưởng - Khám phá - Hợp lệ - Phát triển - Bền vững - Quay lại. Và khám phá cách phát triển sản phẩm theo giai đoạn cuộc đời của chúng và đảm bảo đầu tư đúng mức cho từng sản phẩm được giao. Có một hướng dẫn từng bước về các phương pháp phát triển sản phẩm tốt nhất bằng cách sử dụng các ví dụ và nghiên cứu điển hình từ một số công ty và công ty khởi nghiệp.

Vòng đời sản phẩm tinh gọn giúp bạn:

- Đưa một sản phẩm mới từ ý tưởng đến quy mô trong thị trường.

- Hiểu sự khác biệt giữa việc thực hiện trên các sản phẩm đã thành công trên thị trường và việc tìm kiếm các mô hình kinh doanh có lãi cho các sản phẩm mới.

- Sử dụng các công cụ và phương pháp phù hợp để xác nhận các ý tưởng sản phẩm và mô hình kinh doanh mới.

- Hiểu cách quản lý các sản phẩm trưởng thành và loại bỏ các sản phẩm cũ bằng cách sử dụng các nguyên tắc đổi mới tinh gọn.

Và nếu bạn là:

- Người đang đảm nhiệm vai trò quản lý hoặc phân phối sản phẩm trong một startup/doanh nghiệp lâu năm,

- Người đang tìm cách ứng dụng đổi mới sáng tạo tinh gọn (lean innovation) vào công việc hằng ngày,

- Một nhà lãnh đạo mong muốn khơi nguồn đổi mới sáng tạo trong công ty,

- Người đang tìm kiếm những cách thức đổi mới sáng tạo để phát triển công ty và quản lý sản phẩm trong danh mục của mình.

- Và dĩ nhiên nếu bạn không thuộc bất cứ nhân vật nào, mà chỉ đơn thuần muốn phát triển bản thân, chuẩn bị thêm kiến thức và kinh nghiệm vững chắc hơn thì cũng sách cũng dành cho bạn…

Hay bất cứ ai muốn tạo ra những sản phẩm đáp ứng đúng nhu cầu của khách hàng, Vòng đời sản phẩm tinh gọn rất đáng để bạn dành thời gian trải nghiệm nó đấy. Hy vọng bạn sẽ thích hành trình đầy thú vị này!', 162000)
INSERT [dbo].[Book] ([bid], [cid], [bname], [author], [image], [pid], [quantity], [describe], [price]) VALUES (5, N'3', N'Uninvited: Nghĩ Thông Suốt, Đời Nhẹ Như Mây', N'Lysa TerKeurst', N'images\nghithongsuot.jpg', N'3', 9999, N'Uninvited: Nghĩ thông suốt, đời nhẹ như mây

Kẻ thù luôn muốn chúng ta cảm thấy bị từ chối, bị bỏ rơi và cô đơn...

Trong Nghĩ thông suốt, đời nhẹ như mây, tác giả Lysa TerKeurst chia sẻ những trải nghiệm cá nhân sâu sắc của mình về sự từ chối — từ nhận định về người phụ nữ có thân hình săn chắc hoàn hảo một mình một góc cho đến tuổi thơ vô cùng đau đớn bị cha bỏ rơi. Lysa TerKeurst tập trung vào để kiểm tra một cách trung thực gốc rễ của sự từ chối, cũng như khả năng sự từ chối có thể đầu độc các mối quan hệ từ trong ra ngoài, bao gồm cả mối quan hệ của chúng ta với Chúa.

Với sự am hiểu sâu rộng về Kinh thánh, bằng một đức tính trung thực dễ bị tổn thương nhưng không kém phần hóm hỉnh, Lysa TerKeurst sẽ giúp bạn:

• NGỪNG CẢM THẤY BỊ BỎ RƠI bằng cách tin rằng ngay cả khi bạn bị người khác coi thường, bạn vẫn được Chúa lựa chọn.

• THAY ĐỔI KHUYNH HƯỚNG SUY SỤP hoặc kiểm soát hành động của người khác bằng cách dựa vào lòng tôn kính Chúa để xử lý tổn thương của bạn.

• BIẾT CHÍNH XÁC NHỮNG GÌ CẦN CẦU NGUYỆN trong mười ngày tới để ổn định tâm hồn và khôi phục sự tự tin của bạn khi bị từ chối.

• VƯỢT QUA HAI NỖI SỢ HÃI CỐT LÕI nuôi dưỡng sự bất an của bạn bằng cách am hiểu bí mật của sự sở hữu.

Nghĩ thông suốt, đời nhẹ như mây nhắc nhở rằng chúng ta đã được định sẵn cho một tình yêu không bao giờ có thể bị suy giảm, hoen ố, lung lay hay chiếm đoạt - một tình yêu không bị chối từ.

Lời khen tặng dành cho Nghĩ thông suốt, đời nhẹ như mây:

“Đây quả là cuốn sách không thể rời mắt, nó hấp dẫn từ trang đầu đến trang cuối! Là người từng phải chịu nhiều tổn thương, Lysa đã chân tình gợi mở cách thức kiểm soát những nỗi sợ hãi, khước từ, bất an và lo âu mà tất cả chúng ta đều thi thoảng trải qua. Chúng tôi dám cá rằng bạn chưa bao giờ đọc cuốn sách nào như thế này trước đây. Vậy nên, đừng bỏ lỡ nó nhé!” – Tiến sĩ Les & Tiến sĩ Leslie Parrott, Đồng tác giả cuốn Saving Your Marriage Before It Starts

---

“Lysa TerKeurst đã rất tài tình và chẳng ngại tỏ hết lòng mình khi kể về những tranh đấu, vật lộn của chính bản thân để khích lệ và củng cố sức mạnh nội tại trong chúng ta. Đây có lẽ là một trong những cuốn sách hiếm hoi lột tả chi tiết về bản chất con người, đồng thời phân tích kỹ càng những bài học đắt giá trong Kinh Thánh mà tôi từng được đọc.” – Chris Hodges, Mục sư trưởng; Tác giả cuốn Fresh Air và cuốn Four Cups

---

“Là người từng phải đối mặt với sự khước từ vô số lần, Nghĩ thông suốt, đời nhẹ như mây là dòng nước ngọt lành cho tâm hồn khô cháy của tôi. Trong hành trình theo gót Chúa Giê-su, tôi vẫn thường kêu van mong cầu được chữa lành và tìm kiếm những lời Chân lý để nương náu. Cuốn sách này cung cấp những lời chân lý đó, đồng thời, nó còn dạy tôi nhiều bài học về lòng vị tha. Nếu bạn đang tìm kiếm hy vọng, hãy đọc nó!” – Tara C.', 135000)
INSERT [dbo].[Book] ([bid], [cid], [bname], [author], [image], [pid], [quantity], [describe], [price]) VALUES (6, N'3', N'Từ Bóng Tối Đến Ánh Sáng', N'J.Krishnamurti', N'images\tubongtoi.jpg', N'3', 9999, N'Ta cô độc trên đường, không một bóng người trước mặt; có thể nhiều bóng người sau lưng ta, nhưng ta chẳng mong muốn nhìn lại những nỗi đau kinh hoàng của quá khứ. Ở một trong hai phía của đại lộ dài dường như vô tận này của cuộc đời ta, hoang mạc tiêu điều vẫy gọi ta gia nhập sự tĩnh lặng khốn khổ của nó – cái chết. Trước mặt ta, con đường kéo dài hết dặm này đến dặm khác, năm này qua năm khác, thế kỉ này sang thế kỉ khác, trắng xóa trong ánh mặt trời cháy rực nhẫn tâm; con đường liên tục nâng lên theo một độ dốc không thể cảm nhận được. Màu trắng của con đường nhọc nhằn này, cùng với ánh mặt trời chói chang, khiến ta gần như mù lòa; nào, hãy tìm chỗ để ta có thể cho đôi mắt mệt mỏi nghỉ ngơi, khắp mọi nơi là đại dương mênh mông của ánh sáng chói lóa, rành rành trong sự mãnh liệt của nó.

Quyển Từ Bóng Tối Đến Ánh Sáng là bộ sưu tập các bài văn vần và ngụ ngôn từ thời kỳ đầu của J. Krishnamurti thể hiện các quan điểm về cách sống, mang ta ra từ những sai lầm, mù quáng trong bóng tối để đến dần tới ánh sáng của trí tuệ và yêu thương.

Jiddu Krishnamurti là một trong những triết gia, nhà tâm linh vĩ đại nhất mà thế giới từng biết. Ông đã truyền cảm hứng cho Eckhart Tolle, Joseph Campbell, Alan Watts và vẫn tiếp tục truyền cảm hứng cho hàng ngàn người ngày nay. Song ông không hề thuộc về một tôn giáo, tổ chức hay quốc gia nào. Ông cũng không theo bất cứ trường phái chính trị hay tôn giáo nào. Trái lại, ông luôn cho rằng đây chính là những yếu tố gây chia rẽ con người và mang đến cung đột. Chính cách nhìn này đã khiến những lời dạy của ông đặc biệt thiết thực trong thời đại ngày nay.', 60000)
INSERT [dbo].[Book] ([bid], [cid], [bname], [author], [image], [pid], [quantity], [describe], [price]) VALUES (7, N'4', N'Thế Giới Của Peppa - Cầu Vồng', N'Nhiều Tác Giả', N'images\thegioicuapeppa.jpg', N'4', 9999, N'Thế Giới Của Peppa - Cầu Vồng

Heo Peppa và cả nhà có một chuyến đi lên núi. Có gì vui ở trên ấy nhỉ? Liệu có kho báu nào không đây?

Heo Peppa xin chào các bạn nhỏ Việt Nam! Hãy cùng khám phá những câu chuyện dễ thương và vui nhộn trong sê-ri Thế giới của Peppa để hiểu thêm về thế giới của cô bạn heo ngộ nghĩnh và những người thân xung quanh bạn ấy nhé!', 31200)
INSERT [dbo].[Book] ([bid], [cid], [bname], [author], [image], [pid], [quantity], [describe], [price]) VALUES (8, N'4', N'Bộ Hạt Giống Tâm Hồn Dành Cho Thiếu Nhi (Bộ 5 Cuốn)', N'Nhiều tác giả', N'images\hatgiongtamhon.jpg', N'4', 9999, NULL, 238000)
INSERT [dbo].[Book] ([bid], [cid], [bname], [author], [image], [pid], [quantity], [describe], [price]) VALUES (9, N'5', N'Haruki Murakami Và Âm Nhạc Của Ngôn Từ
', N'Jay Rubin', N'images\amnhaccuangontu.jpg', N'3', 9999, N'Haruki Murakami Và Âm Nhạc Của Ngôn Từ

"Thành công lớn của Rubin là chứng minh được sự phức tạp của ký ức và mặt nghĩa lặp đi lặp lại trong tác phẩm của Murakami. Những lập luận sắc sảo của ông cho ta cái nhìn sâu sắc để khám phá ra tính liên tục tạo nên sự ngông cuồng hơn người của nhà văn vĩ đại này. (...) Trình tự thời gian của một sự nghiệp lẫy lừng được Rubin sắp xếp rất thú vị và mạch lạc, nhưng việc ông giỏi nhất chính là kết nối những hình ảnh phong phú trong văn xuôi của Murakami lại với nhau."

- The Independent

PHANBOOK và NXB HỘI NHÀ VĂN trân trọng giới thiệu!

Cuốn sách Haruki Murakami và Âm nhạc của Ngôn từ của tác giả Jay Rubin đã vẽ nên một hành trình khám phá đời sống cá nhân phong phú, kết nối với đó là việc làm sáng tỏ những giai điệu văn chương siêu thực và đầy bí ẩn của tiểu thuyết gia lừng danh - Haruki Murakami.

Cuốn sách tập trung phân tích các tác phẩm nổi bật của hiện tượng văn học này, tính chất âm nhạc trong ngôn từ các tác phẩm của ông, những điều đã tạo nên một Murakami độc đáo như hiện tại; sự đón nhận của công chúng đối với các tác phẩm của Murakami và ảnh hưởng của sự đón nhận đó đối với cuộc sống của ông. Jay Rubin đã chứng minh được sự phức tạp của các mặt nghĩa lặp đi lặp lại trong các tác phẩm của Murakami bằng các lập luận sắc sảo, chính xác.', 239000)
INSERT [dbo].[Book] ([bid], [cid], [bname], [author], [image], [pid], [quantity], [describe], [price]) VALUES (10, N'4', N'Harry Potter - Kỳ Thư Phù Thủy - Bìa Cứng', N'J.K. Rowling', N'images\harrypotterkysuphuthuy.jpg', N'5', 9999, N'Harry Potter - Kỳ Thư Phù Thủy - Bìa Cứng

Đây là một món quà kỳ diệu cho nhiều thế hệ người hâm mộ của bộ tiểu thuyết nhiệm màu này!

Những trang sách minh họa rực rỡ sẽ đưa bạn vút bay vào thế giới phù thủy của Harry Potter. Trong đó, bạn sẽ được:

- Khám phá những địa điểm pháp thuật phi thường

- Tìm hiểu các phương tiện và cách giải trí phổ biến của phù thủy

- Nghiên cứu đủ loại bùa chú quyền năng và phép thuật kỳ quái

- Đối đầu với các sinh vật huyền bí

- Gặp gỡ các pháp sư, phù thủy tên tuổi

Bảy chương sách với các danh sách, biểu đồ, bản đồ tuyệt đẹp sẽ giúp bạn sống lại những khoảnh khắc khó quên, len lỏi vào mọi ngõ ngách thần kỳ, và khám phá mọi vật dụng ma thuật thú vị mà bạn từng mơ tới. Tổng hợp tất cả những điều cần biết từ tập Harry Potter và Hòn đá Phù thủy cho đến Bảo bối Tử thần, đây là cuốn bách khoa toàn thư đầy ắp sự thật thú vị về thế giới phù thủy được trình bày đầy mê hoặc bởi bảy họa sĩ minh họa tuyệt vời trên khắp thế giới.

Đặc biệt, sách có sự tham gia của họa sĩ Phạm Quang Phúc, cũng là người minh họa bìa. Điều này đánh dấu sự vươn ra quốc tế của Việt Nam theo nhiều mặt: lần đầu một họa sĩ Việt Nam tham gia một dự án sách có quy mô toàn thế giới, và đây là cuốn sách đầu tiên do NXB Trẻ phối hợp thực hiện với đối tác để in ở nước ngoài và phát hành cùng lúc với thế giới vào ngày 10/10/2023 (34 phiên bản bằng 34 ngôn ngữ khác nhau).', 378000)
INSERT [dbo].[Book] ([bid], [cid], [bname], [author], [image], [pid], [quantity], [describe], [price]) VALUES (11, N'2', N'Content Đúng Là King (Tái Bản 2021)
', N'Dan Norris', N'images\contentdung.jpg', N'3', 99, N'Xây dựng một doanh nghiệp hàng triệu đôla, mà không tốn 1 đồng quảng cáo. Tại sao không? Với những tuyệt chiêu Content Marketing trong cuốn bí kíp này, bạn sẽ còn làm được nhiều hơn thế!

Cuốn sách này sẽ giúp bạn đạt được một số điều:
Trước tiên, bạn sẽ hoàn toàn hiểu được content marketing là gì và làm thế nào để một chiến lược content marketing trở nên hiệu quả. Bạn có thể sẽ nhận ra rằng mình không phù hợp với công việc này, hoặc sẽ nhảy cẫng lên đầy hứng khởi. Dù thế nào đi nữa, bạn vẫn cần phải hiểu về content marketing trước khi quyết định mọi thứ.

Hai là bạn sẽ học được một mô hình ba bước đơn giản để thực hiện content marketing thành công. Nó sẽ giúp bạn tập trung vào những điều đúng đắn, chứ không phải cứ cặm cụi “viết hằng ngày”.

Và hơn cả, tác giả sẽ khiến cho cuộc sống của bạn đơn giản hơn bằng việc cung cấp một số mô hình và tư liệu quý giá mà bạn có thể dễ dàng tải về. Bạn có thể ngay lập tức áp dụng vào công việc kinh doanh của mình, để xây dựng được chiến lược content
marketing hiệu quả.

Dù bạn là một blogger, nhà tiếp thị nội dung, doanh nhân hay quản lý marketing, cuốn sách này sẽ giúp bạn thấy được phần thưởng bạn xứng đáng được nhận từ những nỗ lực content marketing của mình.', 71200)
INSERT [dbo].[Book] ([bid], [cid], [bname], [author], [image], [pid], [quantity], [describe], [price]) VALUES (12, N'2', N'Thịnh Vượng Tài Chính Tuổi 30 - Tập 2 (Tái Bản 2022)', N'Go Deuk Seong', N'images\thinhvuongtaichinh.jpg', N'3', 999, N'Thịnh Vượng Tài Chính Tuổi 30 - Tập 2 (Tái Bản 2022)Là kết quả của sự kết hợp nhuần nhuyễn giữa trí tuệ và kỹ năng quản lý tài chính từ bước đi của một nhà hoạch định tài chính nổi danh của ngân hàng SC First Hàn Quốc được tập hợp trong cuốn sách này. Thịnh Vượng Tài Chính Tuổi 30 - Tập 2 chú trọng đến những bước chuẩn bị về tài chính, và sự chuẩn bị đó được áp dụng vào đời sống thực tế như thế nào. Có thể nói cuốn sách này là bản thực hành của con người trước những việc cần chuẩn bị cho cuộc sống sau này, những hiện thực khốc liệt, tính cấp bách, tính tất yếu và mức độ cẩn trọng của công việc chuẩn bị cho những tháng năm về hưu.Đại diện Bảo hiểm nhân thọ AIG – Kim Seongil đã nhận định: “Nếu được đọc cuốn sách này sớm, con đường đến thành công của bạn sẽ bằng phẳng hơn. Đây không phải là cuốn sách dạy làm giàu hay liệt kê cách quản lý tài chính đơn thuần. Thông qua việc mô tả kinh nghiệm của năm nhân vật đang làm những công việc bình thường, cuốn sách sẽ lần lượt giảng giải về những vấn đề mà bạn gặp phải trong từng giai đoạn cuộc đời và hướng dẫn bạn cách quản lý tài chính trong giai đoạn đó. Các bạn thanh niên độ tuổi đôi mươi mới bước vào đời, các bạn độ tuổi ba mươi đang trong giai đoạn lập nghiệp, những người độ tuổi bốn mươi với vai trò người chủ gia đình, cùng những công chức độ tuổi năm mươi chuẩn bị về hưu…”Tiền bạc từ xưa đến nay luôn là vấn đề khiến con người suy nghĩ và phiền muộn nhiều nhất. Không sử dụng một mệnh lệnh thức, mà nhờ cách hành văn theo lối tiểu thuyết, tạo cho người đọc cảm giác gần gũi, thân quen, tác giả khéo léo mô tả cuộc sống của con người với việc chi tiêu cá nhân trong ngày. Từ đó nhẹ nhàng truyền tải đến người đọc những nguyên tắc ý nhị, sâu xa nhất, những ý tưởng và nguồn năng lượng tràn đầy. Chỉ đơn thuần là lời giảng, là bài học của Giáo sư Masu mà như một phép thần thông những khó khăn trong quá trình quản lý tài chính được gỡ bỏ một cáh nhẹ nhàng, và mục tiêu về một cuộc sống thịnh vượng trong tương lai không chỉ còn là mơ ước đối với mỗi người nữa.Và theo chính tác giả Go Deuk Seong thì “mục đích cuối cùng của quản lý chi tiêu là đạt đến sự tự do về mặt tài chính, cả đời không phải đau đầu vì tiền, lúc nào cần đến tiền là có để dùng ngay. Đến lúc về hưu chúng ta cũng cần phải được tự do về tài chính, chỉ có như vậy ta mới ứng phó được với những vấn đề sau khi về hưu. Cần biết rằng khoản tiền 1.000 NDT ta đã tiêu khi còn trẻ nếu để dành đến lúc về hưu sẽ có ý nghĩa và tác dụng lớn lao hơn rất nhiều”. Như một con ong chăm chỉ, như một chú kiến cần mẫn, siêng năng, tích lũy từng chút mật ngọt cho đời. Công việc vất vả và hi sinh của ngày hôm nay sẽ được trả thích đáng cho một tương lai tươi sáng, an bình và thịnh vượng sau này.Tất cả rồi sẽ qua đi, chỉ có thời gian là thước đo chính xác nhất kết quả sự nghiệp của mỗi người. Thành công và thịnh vượng hay không, con đường làm giàu 30 năm hay thậm chí chỉ mất hơn 10 năm cũng đều là con đường do bạn phác thảo, vẽ ra và đi qua. Thịnh Vượng Tài Chính Tuổi 30 - Tập 2 sẽ là hành trang, là bản thiết kế chi tiết cho cuộc sống hạnh phúc của bạn mai sau.', 79200)
INSERT [dbo].[Book] ([bid], [cid], [bname], [author], [image], [pid], [quantity], [describe], [price]) VALUES (13, N'2', N'Cái Bắt Tay Triệu Đô - The Million Dollar Handshake
', N'Catherine Molloy', N'images\caibattaytrieudo.png', N'2', 850, N'Bảy giây - bạn có thể đạt được những gì trong từng này thời gian? Thật ra chỉ trong bảy giây ngắn ngủi, bạn đã có thể ghi ấn tượng khó phai với người bạn gặp gỡ lần đầu tiên. Nếu bạn đến gặp ai đó với hy vọng được tuyển dụng, ký kết hợp đồng làm ăn, hoặc thậm chí là tìm bạn đời, ấn tượng ban đầu là hết sức quan trọng và bạn muốn để lại dấu ấn thật tốt đẹp.

Vậy ấn tượng ban đầu đến từ đâu? Tác giả Catherine Molly khẳng định: “Trước cả khi bạn mở lời, cách bạn đi đứng, bắt tay, giao tiếp bằng mắt và kết nối với đối phương đã nói lên rất nhiều điều về bạn”. Và vì thế, chuyên gia giao tiếp này đã chia sẻ những bài học đắt giá về ngôn ngữ cơ thể và phong cách hành vi trong cuốn sách “Cái bắt tay triệu đô” (tựa gốc “The Million Dollar Handshake”), nhằm giúp bạn tạo được ấn tượng tốt đẹp trong mắt người khác chỉ trong vòng bảy giây.

Bản thân tác giả chính là một bằng chứng sống. Trong năm đầu tiên điều hành công ty riêng, Catherine Molloy đã chốt được số hợp đồng có giá trị lên tới một triệu đô-la, tất cả đều bắt nguồn từ những cuộc gặp gỡ trực tiếp đã tạo được ấn tượng tốt với khách hàng tiềm năng, và mỗi cuộc gặp đều bắt đầu bằng cái bắt tay tự tin, chủ động cùng phong cách giao tiếp phù hợp.

Bắt tay như thế nào là đúng cách? Trong chương 1, Catherine Molloy giải thích về cách bắt tay thể hiện sự tự tin của bản thân và lòng tôn trọng dành cho đối phương.

Trong chương 2, bà giới thiệu đến độc giả mọi khía cạnh có liên quan đến ngôn ngữ cơ thể như ánh mắt, nét mặt, giọng nói, cử chỉ… cũng như sức ảnh hưởng của những yếu tố này đối với cơ hội thành công.

Chương 3 bàn về “phong cách hành vi”, một phương tiện giao tiếp hữu hiệu bên cạnh lời nói và các tín hiệu phi ngôn từ. Bạn là người tự tin hay ít nói và suy nghĩ thận trọng? Bạn có muốn trở thành tâm điểm của sự chú ý không? Bạn thích tán gẫu hay muốn đi thẳng vào vấn đề? Theo Catherine, khi biết về phong cách hành vi của bản thân và của người khác, bạn sẽ có thể điều chỉnh cách giao tiếp của mình, khiến đối phương cảm thấy thoải mái và từ đó tăng hiệu quả kết nối.

Chương 4 tập trung vào “tư duy triệu đô”, lối tư duy giúp chúng ta có cái nhìn và niềm tin tích cực hơn về bản thân mình, người khác cũng như các tình huống ta gặp phải. Trong chương 5, tác giả chia sẻ kinh nghiệm làm việc trong môi trường quốc tế, giúp bạn chuẩn bị sẵn sàng cho các cuộc gặp gỡ với những người đến từ nhiều nền văn hóa khác nhau.

Ở chương 6, bạn đọc sẽ khám phá “khuôn khổ kết nối có ý thức”, hay nói cách khác là trạng thái tỉnh thức, luôn toàn tâm toàn ý khi giao tiếp và kết nối.

Không chỉ có cách dẫn dắt súc tích, hấp dẫn và chân thật, Catherine Molloy còn chia sẻ trong “Cái bắt tay triệu đô” những nghiên cứu tâm lý kinh điển, nhiều câu chuyện người thật việc thật, cùng những phần trắc nghiệm thú vị để bạn khám phá phong cách hành vi của mình.

Quyển sách này đặc biệt hữu ích cho các doanh nhân, các bạn sinh viên mới ra trường đang chuẩn bị phỏng vấn xin việc, nhân viên bán hàng và bất cứ ai thường xuyên giao tiếp trong công việc lẫn cuộc sống hằng ngày. Ấn phẩm sẽ giúp bạn tạo được ấn tượng tốt đẹp trong bảy giây tương tác đầu tiên và cả sau đó, nhằm tạo được sự kết nối mạnh mẽ và xây dựng các mối quan hệ sâu sắc cả trong công việc lẫn cuộc sống.

“Đây là quyển sách về việc bắt tay một triệu lần và thành công đàm phán được cả một triệu thoả thuận”, Catherine Molloy hứa hẹn.                  

Về tác giả

Catherine Molloy là chuyên gia giao tiếp kiêm diễn giả quốc tế về thuật lãnh đạo và kỹ năng bán hàng. Với 25 năm kinh nghiệm trong mảng kinh doanh, đào tạo và điều phối, Catherine đã đào sâu nghiên cứu về giao tiếp và ngôn ngữ cơ thể. Bà là nhà sáng lập kiêm giám đốc điều hành của Auspac Business Advantage - một công ty đào tạo đã được trao nhiều giải thưởng.

Catherine sở hữu chứng chỉ thực hành Lập trình ngôn ngữ tư duy (Neuro-linguistic Programming - NLP), đồng thời bà cũng là một nhà tư vấn có áp dụng mô hình tính cách DISC (Directing, Influencing, Stabilising, Complying). Catherine từng hai lần được trao Giải thưởng Quốc tế Stevie, trong đó có một giải về Giáo dục và Dịch vụ Khách hàng, một giải về Đổi mới Sản phẩm. Ngoài ra, bà còn nhận được Giải thưởng Khu vực của Viện Quản lý Úc dành cho nhà quản lý/chủ sở hữu xuất sắc của năm.', 108800)
INSERT [dbo].[Book] ([bid], [cid], [bname], [author], [image], [pid], [quantity], [describe], [price]) VALUES (14, N'5', N'Chữa Lành Ánh Sáng Bản Thể
', N'Barbara Ann Brennan', N'images\chualanhanhsang.jpg', N'3', 110, N'Tôi tin rằng Barbara Brennan có thể dễ dàng được xem như một nhà chữa trị bằng bàn tay và thấu thị có ảnh hưởng nhất của thế kỷ 21. Có thể thấy rõ, công trình của bà mang tính tiên phong và đột phá. Các lý thuyết của Barbara Brennan về Trường Năng lượng Con người (HEF) đang được trích dẫn rộng rãi. Trên thực tế, các lý thuyết của bà về Trường Năng lượng Con người đã được ứng dụng và được xây dựng thành những thông tin giới thiệu chung về trường chữa trị năng lượng. Chúng đã đóng vai trò công cụ truyền tải thông tin và hướng dẫn đối với nhiều mô hình chữa trị bằng năng lượng mới được tạo ra gần đây. Các khía cạnh khác trong công trình của bà, như tầm quan trọng của chủ định rõ ràng, cũng đã được chứng minh là có ảnh hưởng sâu rộng. Tôi không mảy may nghi ngờ về ngôi trường của bà, về những buổi thực trình, các cuốn sách, các học viên, và tầm ảnh hưởng bao trùm của bà đã chạm đến hàng vạn nếu không muốn nói là hàng triệu cuộc đời trên thế giới.

Mọi người rõ ràng đã rất thích thú với những câu chuyện cuộc đời của Barbara. Họ muốn biết về thời thơ ấu, về khả năng chữa trị của bà, và về thế giới của những hiện tượng tâm linh vô hình mà bà có khả năng nhìn thấy và trải nghiệm. Các chủ đề này thường được nêu lên trong các câu hỏi từ phía các học viên và cử tọa tham dự các bài giảng của bà. Barbara đã dẫn dắt người nghe qua nhiều chủ đề, từ các vấn đề cá nhân cho đến các vấn đề toàn cầu, cùng một loạt các chủ đề khác, trong đó có: sức khỏe, chữa trị, tâm lý, tâm linh, các thiên thần, và ma quỷ. Bất kỳ chủ đề nào có tiềm năng đem lại lợi ích cho người khác đều được bà coi trọng.

Giờ đây, lần đầu tiên, độc giả sẽ được chính Barbara kể câu chuyện về cuộc đời bà. Bạn có thể cảm thấy một số chủ đề hơi cổ và thậm chí lạc hậu. Điều này hoàn toàn không nằm ngoài dự đoán nếu xét đến việc Barbara Brennan lớn lên trong thập niên 1940 và sống tại một trang trại ở bang Wisconsin. Bà thường chia sẻ rằng, trong quãng đời từ lúc thơ bé đến khi trưởng thành, cho đến khi rời nhà để vào đại học, bà không được tiếp xúc với nhiều thứ lắm - ngoại trừ những con bò. Barbara trải qua thời thơ ấu trong giai đoạn mà roi vọt vẫn là hình thức trừng phạt thường thấy ở hầu hết các bậc cha mẹ. Ngay cả trong giai đoạn trưởng thành của bà, mọi thứ đều rất khác so với thế giới ngày nay. Tuy nhiên, từ cả quan điểm toàn cầu lẫn quan điểm cá nhân, thông điệp mà Barbara truyền đạt vẫn vượt ra ngoài giới hạn của thời gian. Trên quan điểm toàn cầu, những thách thức mà nhân loại của ngày hôm nay đang phải đương đầu cũng giống hệt như những thách thức trong quá khứ. Trên quan điểm của cá nhân, với tư cách là những con người, tất cả chúng ta đều mong ước được sống cuộc sống có ý nghĩa và phát huy tối đa tiềm năng sáng tạo của mình.

Chữa lành Ánh sáng Bản thể tập trung vào các hiện tượng khiến cho Barbara Brennan trở nên khác biệt với những người khác trong lĩnh vực chữa trị. Xuyên suốt cuốn sách này, người đọc có thể dễ dàng nhận ra những suy nghĩ của Barbara trong quá trình bà đi qua những khác biệt đó và những gian truân mà bà đã vượt qua để hòa hợp với cả hai phương diện của bản thân - nhà khoa học và nhà chữa trị. Nhiều người trong chúng ta khao khát được nhìn thấy, cảm thấy và trải nghiệm thế giới vô hình; khao khát ấy có thể đến như một biểu hiện đơn giản của niềm mong mỏi muốn được liên hệ với một người thân yêu đã qua đời. Và đây chính là điểm làm hiển lộ một trong những tài năng lớn nhất của Barbara: khả năng tạo ra cầu nối giữa thế giới hữu hình và thế giới vô hình, và khả năng cho phép độc giả bước qua những thế giới đó cùng với bà.

Chữa lành Ánh sáng Bản thể xoay quanh quá trình sáng tạo để làm phát lộ cuộc đời mơ ước của bạn!

Trong Phần I, Barbara Brennan đã điểm lại cấu hình của Hệ thống Ý thức Năng lượng Con người (HECS). Kế đó, bà mô tả quá trình sáng tạo khi nó chảy qua Hệ thống Ý Thức Năng lượng Con người. Khi xung lực sáng tạo được giải phóng, chúng ta có khả năng hiện thực hóa ước mơ của mình. Thật không may, tất cả chúng ta đều có những tắc nghẽn làm ngăn chặn dòng chảy sáng tạo. Những chỗ tắc nghẽn này là những nơi mà năng lượng của chúng ta bị chặn lại do các thương tổn và chấn thương từng xảy ra trong thời thơ ấu. Chúng ngăn chặn không cho chúng ta tạo ra những gì mình muốn và xô chúng ta vào vòng luẩn quẩn của các khuôn mẫu lặp đi lặp lại. Barbara hướng dẫn chúng ta từng bước một giải phóng những chỗ tắc nghẽn đó. Khi các khối tắc nghẽn được giải phóng, năng lượng sáng tạo sẽ tự do tuôn chảy, và kết quả cuối cùng không chỉ là hiện thực hóa các khát vọng từ trái tim của chúng ta mà còn là ta sẽ có thêm nhiều tinh túy hơn, nhiều ánh sáng cốt lõi hơn.

Cuốn sách mang tính đột phá - Bàn tay Ánh sáng - từng giới thiệu với người đọc tác dụng vươn xa của Trường Năng lượng Con người như một công cụ để chúng ta trải nghiệm thực tại của mình. Tương tự như vậy, phần II của cuốn Chữa lành Ánh sáng Bản thể dẫn dắt độc giả vào một hành trình chưa từng có tiền lệ của vầng thứ tư, hay vầng tinh tú, của Trường Năng lượng Con người, soi sáng thế giới bí ẩn và thường bị hiểu nhầm này, đồng thời làm rõ những tác động sâu sắc của nó đối với chúng ta, với những mối quan hệ của chúng ta, và với nhân loại. Vầng thứ tư là cầu nối giữa thế giới vật lý ba chiều và các thế giới tâm linh cao hơn. Vầng thứ tư chứa đựng tất cả mọi thứ từ các vật thể cho đến các sinh thể và các hình thái tư duy. Đây là vầng của mối quan hệ, và như vậy chúng ta luôn luôn cùng sáng tạo với các cư dân của vầng thứ tư thông qua luật “giống nhau thì hấp dẫn nhau”. Vầng này cũng được biết tới như là thế giới tinh tú (astral world). Vì vầng thứ tư không tồn tại trong thực tại ba chiều, nên vầng này không thể thấy được bằng mắt thường. Thế nhưng từ thời xa xưa, nhiều nền văn hóa khác nhau đã mô tả và tiếp cận được với thế giới này.

Phần II bắt đầu với mô tả về cách thức hoạt động của Tri giác Cao cấp và cách nhận biết các vầng của Hệ thống Ý thức Năng lượng Con người. Trước khi có thể hiểu vầng thứ tư, chúng ta phải nhận thức được về nó! Kế đó, Barbara giải thích chi tiết về vầng thứ tư và nó vận hành khác với thế giới vật lý ra sao. Bà trình bày rất nhiều ví dụ từ thực tiễn chữa trị của bản thân mình, bao gồm cả các trải nghiệm của bà trong quá trình làm việc với một loạt các vật thể và sinh thể, đi thăm các cõi thấp của vầng thứ tư, và cuộc chạm trán giữa bà với tà thuật.

Barbara định nghĩa những khối tắc nghẽn trong vầng thứ tư - những yếu tố chặn đứng quá trình sáng tạo - là các “bao nang thời gian” có khả năng đã diễn biến qua nhiều kiếp sống. Bà mô tả quá trình giải phóng năng lượng sáng tạo bị tắc nghẽn này thông qua các phiên chữa trị bao nang thời gian. Bà giải thích Hệ thống Ý thức Năng lượng Con người bị ảnh hưởng ra sao thông qua quá trình chết và dịch chuyển qua cơ thể tinh tú.

Vì vầng thứ tư là vầng của mối quan hệ, nên chúng ta sẽ thấy có nhiều loại dây nối. Những sợi dây này phục vụ cho việc truyền dẫn thông tin vô hình, thường xảy ra giữa hai người. Ví dụ, chúng ta tạo ra các sợi dây gien di truyền với cha mẹ đẻ của mình và sau đó là những sợi dây quan hệ với mọi người mà chúng ta có kết nối cá nhân. Những sợi dây này có thể là lành mạnh hoặc cũng có thể mang theo những biến dạng sẽ gây can nhiễu đến quá trình sáng tạo của chúng ta. Các cội rễ truyền thừa, tức các sợi dây gien di truyền bị hư hại, kết nối chúng ta với tổ tiên của mình và mang theo các hệ thống niềm tin sai lầm được duy trì qua nhiều thế hệ. Barbara Brennan giải thích chi tiết về việc chữa trị những sợi dây gien di truyền và sợi dây quan hệ, cũng như việc chữa trị cội rễ truyền thừa.

Chia sẻ của Lisa VanOstrand (Tốt nghiệp Trường chữa trị Barbara Brennan năm 1995 Trường khoa giải phẫu sinh lý Trường chữa trị Barbara Brennan, Nguyên Trưởng khoa Nâng cao Trường chữa trị Barbara Brennan).', 176000)
INSERT [dbo].[Book] ([bid], [cid], [bname], [author], [image], [pid], [quantity], [describe], [price]) VALUES (15, N'5', N'Trump Ở Nhà Trắng
', N'Bob Woodward', N'images\trumponhatrang.jpg', N'1', 700, N'Năm 2016, cả thế giới sửng sốt về chiến thắng của tân binh Donald Trump trước cựu binh lão luyện và được nhiều người kỳ vọng Hillary Clinton.

Kể từ đó, nước Mỹ nói riêng và thế giới nói chung cùng trải qua những khoảnh khắc dở mếu dở cười trong tâm trạng thắc thỏm triền miên vì không biết chuyện gì sẽ xảy ra tiếp theo. Chưa có nhiệm kỳ tổng thống nào mà công chúng lại được nhận tin về các quyết sách quan trọng của chính phủ qua những bài đăng ngắn ngủi dài 280 ký tự trên trang mạng xã hội Twitter, chưa có nhiệm kỳ tổng thống nào mà sự đến đi của các nhân vật trong Nhà Trắng lại rầm rộ, lũ lượt, bất thường, và bất ngờ như vậy. Điều gì đang diễn ra với Trump trong Nhà Trắng vậy?

Fear: Trump ở Nhà Trắng là cuốn sách táo bạo, trả lời thẳng thắn cho câu hỏi trên. Đây là công trình công phu của Bob Woodward, miêu tả trần trụi và sống động những cuộc tranh luận, quá trình ra quyết định và cuộc sống bên trong Nhà Trắng từ nguồn cấp tin chính là những con người đã và đang sống ở đó.

Cuốn sách đáp ứng niềm mong đợi của mọi người đến nỗi ngay trong tuần đầu tiên ra mắt đã bán được 1,1 triệu bản – một kỷ lục trong lịch sử 124 năm hoạt động của Simon & Schuster.', 119200)
INSERT [dbo].[Book] ([bid], [cid], [bname], [author], [image], [pid], [quantity], [describe], [price]) VALUES (16, N'5', N'Bàn Về Khế Ước Xã Hội (Tái Bản 2018)
', N'Jean Jacques Rousseau', N'images\banvekheuocxahoi.jpg', N'1', 650, N'Bàn về Khế ước xã hội là tên gọi vắn tắt của bản luận văn lớn mà J. J. Rousseau đặt dưới một nhan đề khá dài: Bàn về khế ước xã hội hay là các nguyên tắc của quyền chính trị (Du Contrat social – ou principes du droit politique).

Về lai lịch cuốn sách, tác giả viết: “Luận văn nhỏ này trích từ một công trình nghiên cứu rộng lớn mà trước kia tôi đã viết, nhưng vì chưa lượng được sức mình nên phải bỏ đi từ lâu”.

Về mục đích cuốn sách, tác giả viết: “Tôi muốn tìm xem trong trật tự dân sự có hay không một số quy tắc cai trị chính đáng, vững chắc, biết đối đãi với con người như con người. Và có hay không luật pháp đúng với những ý nghĩa chân thực của nó”. Với luận văn này, J. J. Rousseau muốn “gắn liền cái mà luật pháp cho phép làm với cái mà lợi ích thúc đẩy phải làm, khiến cho công lý và lợi ích không tách rời nhau”.

Toàn bộ luận văn trên dưới sáu vạn chữ được chia làm bốn quyển:

Quyển thứ nhất gồm 9 chương, mở ra những ý niệm chung về sự hình thành một xã hội người từ trạng thái tự nhiên chuyển sang trạng thái dân sự và những ý niệm chung về việc thành lập Công ước xã hội.

Quyển thứ hai gồm 12 chương, chủ yếu bàn về vấn đề lập pháp.

Quyển thứ ba gồm 18 chương, bàn chủ yếu về vấn đề cơ quan hành pháp.

Quyển thứ tư gồm 9 chương, bàn tiếp nhiều vấn đề, trong đó nổi lên vấn đề cơ quan tư pháp.

Những người yêu J. J. Rousseau và đã đọc Bàn về Khế ước xã hội thường nói: đọc Bàn về Khế ước xã hội thật là mệt. Vì vănchương của tác giả vừa uyên thâm, vừa uẩn súc; cách lậpluận của ông dựa vào phương pháp logic kiểu Descartes,rành rọt, hiển nhiên, nhưng đồng thời bao quát nhiều ýniệm, soi vào nhiều góc cạnh của vấn đề, lại phải trìnhbày rất khéo léo những quan điểm đối nghịch với chínhthống đương thời. Bài luận văn có những câu dài tới trên10 dòng, phải tách nhỏ ra một cách linh hoạt thì mới diễndịch được tư duy của tác giả. Nhưng thật là một niềmvui lớn cho người nghiên cứu khi nắm bắt được những ýlớn và khái quát được tư tưởng vĩ đại của J. J. Rousseautrong Bàn về Khế ước xã hội. Cuốn sách được in chui và phát hànhđầu năm 1762, khi mà Chính phủ Hoàng gia và Nghịviện Pháp ra lệnh đốt một số sách của Rousseau. Ôngphải chạy trốn, sống cuộc đời lưu vong, không ổn định vànghèo khổ, cho đến ngày 2/7/1788, từ giã cõi đời tại làngCamenonville, và chôn trên hòn đảo Dương Liễu heo hútngày 4/7/1788.

Những tư tưởng của Khế ước xã hội đã lay động bao lớp người không thỏa hiệp với chế độ quân chủ chuyên chế thời ấy; và khi cuộc Cách mạng Pháp kết thúc năm 1794, Hội nghị Quốc ước đã quyết định đưa hình tượng và tro hài của Jean-Jacques Rousseau vào Điện Panthéon, nơi chôn cất và lưu niệm các bậc vĩ nhân đã làm vẻ vang cho nước Pháp.

Trên 200 năm đã trôi qua, kể từ ngày Bàn về Khế ước xã hội ra đời mà luồng sáng do tác phẩm rọi ra vẫn còn ánh lên trước mắt chúng ta ngày nay.', 112500)
INSERT [dbo].[Book] ([bid], [cid], [bname], [author], [image], [pid], [quantity], [describe], [price]) VALUES (17, N'3', N'Nguyên Lý Marketing
', N'Philip Kotler, Gary Armstrong', N'images\nguyenlymarketing.jpg', N'4', 400, N'
Nguyên Lý Marketing

Cuốn sách có thể được xem như là giáo trình kinh điển dành cho bất cứ ai muốn nghiên cứu lĩnh vực marketing, bởi nó chứa bên trong gần như tất cả những gì bạn cần biết về marketing – từ định nghĩa, lý luận, các nguyên tắc, cho đến ứng dụng, ví dụ thực tế. Sách cũng không ngừng được chỉnh sửa, tái biên soạn, cập nhật thêm thông tin, trường hợp nghiên cứu mới cho phù hợp với tình hình kinh tế không ngừng thay đổi.

ĐẶC ĐIỂM NỔI BẬT:

- Ngoài các khái niệm cốt lõi của lĩnh vực marketing được tổng kết qua thời gian, hai tác giả Philip Kotler và Gary Armstrong tập trung vào phân tích công việc marketing trong bối cảnh kinh tế đầy thách thức hiện nay.

Cuốn sách trình bày thông tin marketing nền tảng theo một hình thức sáng tạo và dễ hiểu, đầy đủ những dẫn chứng, minh họa được lấy từ thực tiễn sống động của thương trường. Sau mỗi chương sách đều có phần tóm tắt rất cô đọng, giúp người đọc củng cố lại kiến thức tiếp thu được trong chương đó. Đồng thời, sách cũng có phần thảo luận và ứng dụng nhằm mở rộng hiểu biết của độc giả về lĩnh vực này.

- Tác giả của cuốn sách – giáo sư marketing Philip Kotler được coi là cha đẻ của ngành marketing hiện đại. Ông được xem là huyền thoại duy nhất về marketing, đồng thời là một trong bốn nhà quản trị vĩ đại nhất mọi thời đại, cùng với Peter Drucker, Jack Welch và Bill Gates.

Không chỉ trong lĩnh vực học thuật, những kiến thức của Kotler còn được tiếp nhận và áp dụng rộng rãi trong kinh doanh toàn cầu. Philip Kotler nổi tiếng khắp thế giới vì là tác giả của hơn 100 cuốn sách và bài báo chuyên về marketing và quản trị kinh doanh. Giáo sư Kotler còn có tác động tích cực tới nền kinh doanh trên toàn thế giới bởi ông phổ biến khái niệm marketing xã hội, trách nhiệm xã hội của marketing và giúp thế giới xây dựng một nền kinh doanh nhân bản hơn.

- 20 chương của cuốn sách là một bộ khung toàn diện với những kiến thức vô cùng đầy đủ, chi tiết cho bất cứ ai muốn có cái nhìn tổng quan về ngành marketing. Sách rất nhiều lí thuyết nhưng được trình bày dưới bàn tay và khối óc của ông vua marketing nên cũng giống như một sản phẩm giá trị. Đi kèm với lí thuyết luôn là những ví dụ minh họa sinh động, dễ hiểu và đa góc cạnh nên người đọc không hề thấy nhàm chán.', 631200)
INSERT [dbo].[Book] ([bid], [cid], [bname], [author], [image], [pid], [quantity], [describe], [price]) VALUES (18, N'1', N'Trong Chớp Mắt (Tái Bản 2018)
', N'Malcolm Gladwell', N'images\trongchopmat.jpg', N'2', 500, N'Trong Chớp Mắt (Tái Bản 2018)

Trong chớp mắt là một cuốn sách chiến lược viết về sức mạnh của việc nghĩ mà không cần suy nghĩ, về những quyết định đưa ra chỉ trong một cái chớp mắt thực sự không hề tầm thường như mọi người vẫn nghĩ. Vì sao một số người luôn là những người quyết định sáng suốt, trong khi số khác lại luôn lầm lẫn, quẩn quanh… Tại sao một số người hành động theo bản năng của họ và chiến thắng, một số người lại luôn kết thúc bằng sai lầm. Não của chúng ta thực sự hoạt động thế nào: trong công sở, trong lớp học, trong bếp và phòng ngủ… Và vì sao những quyết định đúng đắn nhất lại thường là những quyết định không thể lý giải rõ ràng cho người khác.

Ngay phần giới thiệu, Malcolm Gladwell đã đưa ra một tình huống đặc biệt. Một bức tượng cổ đã được cả một hội đồng khoa học gồm rất nhiều chuyên gia hàng đầu của một bảo tàng ở Mỹ khẳng định chắc chắn là thật nhưng cuối cùng được phát hiện là đồ giả mạo. Không phải bằng các thiết bị tối tân mà chỉ bằng một thoáng nhìn kéo dài 2 giây của một số chuyên gia khi họ có dịp thăm bảo tàng. Như vậy chỉ cần 2 giây, họ có thể nắm rõ được bản chất bên trong của bức tượng hơn cả một đội ngũ chuyên gia của bảo tàng đã nghiên cứu bức tượng trong 14 tháng.

Trong chớp mắt sẽ cho chúng ta gặp một nhà tâm lý học, người có thể tiên đoán cuộc hôn nhân nào sẽ đổ vỡ chỉ dựa vào vài phút quan sát cặp vợ chồng, một huấn luyện viên tennis, người có thể biết khi nào một vận động viên sẽ phạm lỗi kép thậm chí trước khi vợt kịp chạm đến bóng, một chuyên gia thẩm định đồ cổ, người có thể nhận ra sự giả mạo bằng một cái nhìn thoáng qua. Cuốn sách kỹ năng này tiết lộ một bí mật: những người quyết định vĩ đại không phải là những người sử dụng hầu hết thông tin, thời gian để cân nhắc kĩ lưỡng, mà lại là những người thành thạo trong nghệ thuật “lát cắt mỏng”, nắm bắt được mọi khía cạnh vấn đề từ một lát cắt mỏng.', 125100)
INSERT [dbo].[Book] ([bid], [cid], [bname], [author], [image], [pid], [quantity], [describe], [price]) VALUES (19, N'1', N'Cư Xử Khôn Giao Tiếp Khéo
', N'Dan Ariely', N'images\cuxukhongiaotiepkheo.jpg', N'3', 4000, N'Cư Xử Khôn Giao Tiếp Khéo
Cuốn sách ghi lại những bài học từ nghiên cứu đột phá của Ariely khi họ khám phá câu hỏi cốt yếu: Làm thế nào chúng ta có thể đưa ra quyết định tốt hơn?

Những quyết định tuyệt vời theo chân người kể chuyện, Adam, khi anh ta phải đối mặt với hàng loạt lựa chọn và cân nhắc hàng ngày. Ông tung ra hai bộ chuẩn mực chồng chéo và thường mâu thuẫn với nhau: chuẩn mực xã hội và chuẩn mực thị trường. Những chuẩn mực này thông báo cho suy nghĩ của chúng ta theo những cách mà chúng ta thường không nhận thấy, cũng giống như Adam bị che khuất bởi “nàng tiên thị trường” và “nàng tiên xã hội”, mỗi người đều buộc anh ta phải hành động theo những cách nhất định. Ariely lập luận, ra quyết định tốt đòi hỏi chúng ta phải xác định và đánh giá các lực lượng khi thi đấu trong các hoàn cảnh khác nhau, dẫn đến một kết quả tối ưu. Quyết định tuyệt vời là một hướng dẫn hấp dẫn và thú vị để phát triển các kỹ năng sẽ chứng tỏ vô giá trong cuộc sống cá nhân và nghề nghiệp.

Trích đoạn hay

- Ta quan tâm bản thân hơn tất cả, kỳ kèo để được trả công cao nhất và phải trả chi phí thấp nhất.

Trong mọi cuộc trao đổi, chúng ta mong đợi nhận được đúng lúc và chính xác thứ mình muốn.

- Làm thế nào ta có thể duy trì song song những giá trị dường như đối lập? Vâng, tôi đến đây để nói với anh rằng chúng ta thực sự sống giữa hai thế giới rất khác biệt.

Những chuẩn mực thị trường thống trị một thế giới…

… trong khi những chuẩn mực xã hội thống trị thế giới còn lại.

“Chuẩn mực” là các quy tắc hướng dẫn hành vi được mong đợi trong những tình huống nhất định.

- Cuộc sống trông như thế nào trong thế giới sắc lạnh của những chuẩn mực thị trường?

Ở đây, mọi trao đổi là giao dịch giữa các đối tác làm ăn, không phải giữa bạn bè với nhau.

Dựa theo phân tích cẩn thận về chi phí-lợi ích, mọi người chú trọng lợi ích của chính mình trên hết.

Rất lô-gíc!', 103200)
INSERT [dbo].[Book] ([bid], [cid], [bname], [author], [image], [pid], [quantity], [describe], [price]) VALUES (20, N'1', N'Trí Tuệ Xúc Cảm (Tái bản 2021)
', N' Daniel Goleman', N'images\trituexuccam.jpg', N'5', 666, N'Trí Tuệ Xúc Cảm đã nằm trong danh sách bán chạy nhất của Thời báo New York trong một năm rưỡi, với hơn 5.000.000 bản in trên toàn thế giới bằng 40 ngôn ngữ và đã là sách bán chạy nhất ở nhiều quốc gia. Sách đã được Tạp chí TIME vinh danh là một trong 25 “Cuốn sách quản lý kinh doanh có ảnh hưởng nhất” 

Với bản Tiếng Việt được Alpha Books mua bản quyền và độc quyền phát hành từ 2008, được vô vàn độc giả đón nhận với hơn 50.000 bản được bán ra, và cũng trở thành 1 trong những cuốn bestseller. 

Ai cũng biết điểm IQ cao chưa chắc đã đảm bảo cho một cuộc đời thành công, hạnh phúc và đức hạnh. Nhưng chỉ đến khi đọc Trí Tuệ Xúc Cảm (Emotional Intelligence) của Daniel Goleman, chúng ta mới có thể lý giải tại sao. Dựa trên những quan sát và nghiên cứu nhiều năm trong lĩnh vực tâm lý và khoa học thần kinh, tác giả đã mang đến một cái nhìn mới mẻ về hai loại trí tuệ bên trong mỗi con người - lý trí và cảm xúc - cùng cách mà chúng định hình số phận của chúng ta.    

Trong sách, Daniel Goleman chỉ ra một số yếu tố khiến người IQ cao có thể gặp lúng túng trong công việc, còn người IQ thấp hơn lại đạt hiệu suất đáng kinh ngạc. Đó là sự tự ý thức, tính kỷ luật tự giác, sự đồng cảm, ... và chúng không bị mặc định từ khi sinh ra. Trí tuệ cảm xúc được bồi đắp bởi những trải nghiệm từ khi còn nhỏ, nhưng nó cũng có thể được nuôi dưỡng và tăng cường trong quá trình mỗi cá nhân trưởng thành, đem đến lợi ích cho sức khỏe, công việc và cả các mối quan hệ của họ.   ', 159200)
INSERT [dbo].[Book] ([bid], [cid], [bname], [author], [image], [pid], [quantity], [describe], [price]) VALUES (21, N'2', N'Tư Duy Về Tiền Bạc - Những Lựa Chọn Tài Chính Đúng Đắn Và Sáng Suốt Hơn ', N'Jonathan Clements', N'images\tuduyvetienbac.jpg', N'2', 401, N'Tư Duy Về Tiền Bạc - Những Lựa Chọn Tài Chính Đúng Đắn Và Sáng Suốt Hơn (Tái Bản 2022)

Mục tiêu của bạn trong vấn đề tài chính cá nhân và đầu tư là gì?

Qua Tư duy về tiền bạc - sản phẩm của hơn 30 năm làm việc trong lĩnh vực tài chính cá nhân, Jonathan Clements đã cung cấp cho bạn đọc một cách thức rõ ràng hơn, sáng suốt hơn để suy nghĩ về tình trạng tài chính của mình, để có những lựa chọn thông minh hơn và giành được nhiều hạnh phúc nhất từ những đồng tiền mình.

Ngắn gọn, rõ ràng và đầy ắp những lời khuyên tuyệt vời về tài chính, cuốn sách sẽ dạy bạn cách phớt lờ các bản năng của mình, kiềm chế nhưng cảm xúc, hít thở sâu và không ngừng tập trung vào những gì tốt nhất cho bản thân - cho hạnh phúc và tự do tài chính của bạn trong suốt một đời người.', 72000)
INSERT [dbo].[Book] ([bid], [cid], [bname], [author], [image], [pid], [quantity], [describe], [price]) VALUES (22, N'3', N'Đôi mắt', N'Nam Cao', N'images\doimat.jpg', N'3', 605, N'Trích đoạn:

Cười

Hòa bình và hạnh phúc tỏa bóng mát trong cái nhà bé nhỏ của chúng. Giá tất cả trẻ con đều hiểu rằng: chúng sinh ra là để đi bộ, để mở những con mắt hau háu ra cười với người ta, để chim chim, đi chợ, làm cò bay hay những trò ngây ngô tương tự như thế chứ không phải để dụi mắt, để dỗi hờn, để khóc the thé đến làm bố điên lên được. Giá tất cả đàn bà đều hiểu rằng: người ta cưới họ về là để họ đem cho người ta những nụ cười, những cái vuốt ve, những lời nói nhẹ nhàng, khả dĩ khiến người ta quên mệt nhọc và chán nản chứ không phải chuốc lấy những lời cáu cẳn và một bộ mặt suốt ngày nhăn nhó như mặt nạ.

Nước mắt

Người không phải là thánh. Sự khổ sở dễ khiến lòng chua chát. Khi người ta lam lũ quá, lại còn lo trăm thứ, bị làm rầy vì trăm thứ, thì ai mà bình tĩnh được? Ai mà chả hay gắt gỏng? Gắt gỏng thì chính mình khổ trước. Không giữ được thì bật ra ngoài như vậy. Thật ra có ai muốn cau có làm chi?...

Ở hiền

Tại sao trên đời này lại có nhiều sự bất công đến thế? Tại sao ở hiền không phải bao giờ cũng gặp lành? Tại sao những kẻ hay nhịn, hay nhường thì thường lại chẳng được ai nhịn, nhường mình; còn những kẻ thành công thì hầu hết lại là những người rất tham lam, chẳng biết nhịn nhường ai, nhiều khi lại xảo trá, lọc lừa và tàn nhẫn, nhất là tàn nhẫn?...', 44500)
INSERT [dbo].[Book] ([bid], [cid], [bname], [author], [image], [pid], [quantity], [describe], [price]) VALUES (23, N'3', N'Bỉ vỏ', N'Nguyên Hồng', N'images\bivo.jpg', N'2', 402, N'Bỉ vỏ
Nguyên Hồng tên thật là Nguyễn Nguyên Hồng, sinh ngày 5 tháng 11 năm 1918 trong một gia đình công giáo ở thành phố Nam Định. Trong cuộc kháng chiến chống Pháp, Nguyên Hồng hoạt động ở Hội Văn nghệ Việt Nam (1947 - 1957) và tham gia Ban biên tập Tạp chí Văn nghệ, ban phụ trách trường Văn nghệ nhân dân ở Việt Bắc. Năm 1948, nhà văn được kết nạp vào Đảng cộng sản Đông Dương. Năm 1957, Hội nhà văn thành lập, Nguyên Hồng tham gia Ban chấp hành, là biên tập viên tạp chí Văn nghệ và ở trong Ban phụ trách tuần báo Văn. Nguyên Hồng mất ngày 2-5 -1982.

“Bỉ vỏ”: “...Ngay ở những tầng lớp cặn bã nhất, chỉ biết có chém giết lừa bịp, vẫn ánh lên những tia sáng nhân đạo, vẫn còn lòng yêu thương chung thủy, lòng hi sinh, dám xả thân vì một nghĩa cử, dám sống chết để bảo vệ đồng đội và nhất là những thoáng khát vọng muốn thoát khỏi cuộc đời tội lỗi của mình. Cái nhìn của Nguyên Hồng ở đây cũng giống như cái nhìn của Gorki khi viết về tầng lớp “dưới đáy” của xã hội Nga, mang đầy tính chất nhân đạo chủ nghĩa. Cho nên đọc chuyện những nhân vật này, ta thấy tội ác của họ, nhưng đồng thời cũng thương xót cho những kiếp người đã bị xã hội độc ác nhấn chìm vào vũng bùn tội lỗi và ngụp lặn trong ấy cơ hồ không thể ngoi lên được...”

', 38300)
INSERT [dbo].[Book] ([bid], [cid], [bname], [author], [image], [pid], [quantity], [describe], [price]) VALUES (24, N'3', N'Nanh Trắng
', N'Jack London', N'images\nanhtrang.jpg', N'3', 602, N'Nanh Trắng
Jack London (1876- 1916) là nhà văn nổi tiếng người Mỹ. Cuộc sống khốn khó từ nhỏ đã đẩy Jack London bước vào rất nhiều cuộc phiêu lưu, trải qua đủ nghề để kiếm sống. Tất cả những điều này đã ám ảnh Jack London và trở thành nguồn cảm hứng để ông viết nên những câu chuyện danh tiếng như: Đứa con của chó sói (1902), Nanh trắng (1906), Ánh sáng ban ngày cháy đỏ (1910), Tiếng gọi của hoang dã (1903)...

Tiểu thuyết Nanh Trắng một câu chuyện đẹp kể về hành trình trưởng thành của một chú chó lai mang ba phần tư dòng máu sói hoang dã trở thành chú chó nhà trung thành. Tiểu thuyết này không đơn thuần mang tính giải trí mà còn mang đến cho độc giả những bài học quý giá, gửi đến những thông điệp giá trị; cho dù cuộc sống nhiều chông gai và khó khăn nhưng ánh sáng hạnh phúc vẫn còn đang đón chờ ở phía trước.

Tác phẩm này mang đặc thù phong cách văn xuôi chính của Jack London và cách sử dụng giọng văn, phối cảnh sáng tạo của ông. Phần lớn nội dung tiểu thuyết được viết từ lối nhìn của động vật, cho phép Jack London khảo sát cách mà loài vật nhìn nhận thế giới của chúng và cách mà chúng nhìn nhận loài người. Nanh Trắng khảo sát thế giới bạo lực của dã thú, và thế giới không kém phần bạo lực của nhận loại được xem là văn minh. Cuốn sách cũng đề cập đến những vấn đề phức tạp hơn: luân lý và sự cứu chuộc.', 54000)
INSERT [dbo].[Book] ([bid], [cid], [bname], [author], [image], [pid], [quantity], [describe], [price]) VALUES (25, N'4', N'Happy Reader - Ông Già Và Biển Cả
', N'Ernest Hemingway', N'images\onggiavabienca.jpg', N'1', 301, N'Happy Reader - Ông Già Và Biển Cả
Những câu chuyện cổ tích, những kiệt tác văn học tuyệt vời mà chúng ta đã biết từ thuở còn thơ vẫn luôn là kỷ niệm ấm áp mãi cho đến khi ta trưởng thành. Giờ đây, các tác phẩm văn học kinh điển được thể hiện dưới một hình thức mới mẻ và thú vị sẽ giúp ta làm sống lại những kỷ niệm đó. Bên cạnh đó, ta còn có thể thưởng thức sự sâu sắc và vẻ đẹp của những tác phẩm nguyên bản, điều mà các tác phẩm chuyển ngữ ít khi thực hiện được. Trong quá trình đọc sách, kỹ năng đọc hiểu tiếng Anh của bạn cũng sẽ được nâng cao rất nhiều.

Bộ sách được biên soạn theo một chương trình đặc biệt giúp nâng cao kỹ năng đọc hiểu cho những người mới bắt đầu, những người chưa hài lòng với khả năng làm chủ ngôn ngữ của mình, hay cho học sinh cấp tiểu học, trung học cơ sở và phổ thông. Những học viên này sẽ thưởng thức các kiệt tác văn học bằng tiếng Anh theo một hình thức rất thú vị và có tính hiệu quả cao.

Chương trình được biên soạn theo năm cấp độ, từ cấp độ cơ bản dành cho những người mới bắt đầu, với 350 từ, cho đến cấp độ trung bình khá, với 1.000 từ. Trong từng tập sách đều có các hướng dẫn dành cho người đọc theo từng cấp độ, giúp họ tiếp cận nội dung tác phẩm bằng tiếng Anh một cách dễ dàng hơn. Bộ sách bao gồm những câu hỏi ông tập giúp người đọc học từ vựng và hiểu được ý nghĩa của tác phẩm, cũng như kèm theo các hình minh họa thú vị tô điểm cho từng trang sách.

Với hình thức sách đọc kèm đĩa CD, nội dung tác phẩm được thể hiện lại một cách sinh động bởi các giọng đọc Mỹ chuyên nghiệp. Tác phẩm được viết lại theo từng cấp độ người đọc bởi một đội ngũ chuyên gia biên tập ngôn ngữ bản xứ, dựa trên nền tảng tiếng Anh của người Mỹ chuẩn với từ vựng được đề xuất bởi Bộ Giáo Dục. Vì thế, chương trình này sẽ vô cùng có ích, nhất là cho công tác giảng dạy tiếng Anh.', 66600)
INSERT [dbo].[Book] ([bid], [cid], [bname], [author], [image], [pid], [quantity], [describe], [price]) VALUES (26, N'4', N'Aesop Bất Hủ - Tập 2
', N'Aesop, Val Biro', N'images\aesopbathu.jpg', N'2', 305, N'Aesop Bất Hủ - Tập 2
Truyện ngụ ngôn đã ra đời từ rất lâu trên thế giới, được xem là một kho tàng trí tuệ của văn hoá dân gian.

Ngụ là ẩn chứa, hàm ý, ngôn là ngôn ngữ, lời nói. Truyện ngụ ngôn là những chuyện kể hàm chứa những bài học đạo đức, những triết lý làm người, những nguyên tắc đời sống từ đơn giản đến sâu sắc, được kể bằng cách nhân hoá những loại vật gần gũi, đôi khi cũng kể về con người.

Khi còn nhỏ chúng ta thường được dạy những đạo lý này qua các câu truyện ngụ ngôn. Những bài học thường được đưa vào những cuốn sách, hay những bộ phim hoạt hình đầy sắc màu, vui nhộn.

Trọn bộ hai quyển truyện tranh ngụ ngôn song ngữ Aesop Bất Hủ là minh chứng trong việc truyền tải những triết lý sống, những bài học đạo đức theo cách giản dị, chân thành và dễ hiểu nhất, đặc biệt là với trẻ em. Bằng hình ảnh minh họa màu sắc sinh động, nội dung giản dị, giàu ý nghĩa, phụ huynh có thể dạy cho trẻ những đức tính tốt đẹp rút ra từ những câu chuyện này. Aesop Bất Hủ mang đến những thông điệp ngắn gọn nhưng đầy ý nghĩa nhằm nhắn nhủ bạn đọc những chân lý giản dị trong cuộc sống.

Bộ truyện được thể hiện dưới hình thức song ngữ Việt – Anh. Không chỉ giúp các em nhỏ tiếp thu những bài học đạo đức thú vị mà còn cùng lúc học song song cả Tiếng Việt lẫn Tiếng Anh, mang đến cho trẻ những giây phút thú vị khi đọc.

Mặc dù là truyện ngụ ngôn của Aesop nhưng hầu hết câu chuyện của ông là tác phẩm của những nhà kể chuyện sống trước ông rất lâu. Aesop được cho rằng đã sống ở đất nước Hy Lạp cổ đại vào khoảng thế kỷ 16 trước Công nguyên. Ngày nay có rất nhiều phiên bản khác nhau được kể lại trong những cuốn sách kể chuyện trên khắp thế giới. Những câu chuyện này vẫn được ưa chuộng như xưa nay, đặc biệt là với trẻ em.

Trong những câu chuyện này, động vật có thể trò chuyện và có tính cách như con người, chẳng hạn chuyện “Sư tử và chuột”, “Cáo và cò”. Đây là một kho tàng truyện ngụ ngôn đồ sộ cả về mặt số lượng lẫn giá trị. Với đa số nhân vật là những con vật đã được nhân cách hóa, truyện ngụ ngôn Aesop hàm chứa những thông điệp sâu sắc mà giản dị, được chuyển tải đến người đọc bằng giọng văn nhẹ nhàng, hóm hỉnh.

Trong quá trình lưu truyền đó, một số truyện đã bị mất đi nhưng cũng có một số truyện được thêm vào từ các nền văn hóa khác nhau, thể hiện sự ngưỡng mộ của nhân loại đối với trí tuệ sâu sắc của ông. Ngụ ngôn Aesop đã được trích dẫn bởi Socrates, Aristophanes và các nhân vật nổi tiếng khác.', 108800)
INSERT [dbo].[Book] ([bid], [cid], [bname], [author], [image], [pid], [quantity], [describe], [price]) VALUES (27, N'4', N'Thơ Hay Viết Cho Thiếu Nhi - Gửi Gió Về Cho Nội
', N'Khánh Chi', N'images\thohay.jpg', N'3', 603, N'
Thơ Hay Viết Cho Thiếu Nhi - Gửi Gió Về Cho Nội

Trong con mắt thơ của cô bé Khánh Chi ở lứa tuổi nhi đồng, thế giới hiện ra một cách huyền diệu bay bổng, mới lạ và phong phú. Cô bé vừa nghịch ngợm hồn nhiên như cái nắng nhảy nhót, chui vào lỗ kim của bà, vừa suy tư tưởng tượng độc đáo: “Nắng như lửa từ lòng đất/ Làm hồng hết mặt con sông”, lại vừa tư duy khái quát chững chạc: “Cha ông em giữ bằng máu/ Nên sông đỏ đến bây giờ”…

Người lớn phải ngạc nhiên, không hiểu nổi trước sức tưởng tượng lạ kì của cô bé Khánh Chi, có lẽ chỉ trẻ con mới hiểu…

Nhà thơ KHÁNH CHI
Sinh năm: 1965
Quê quán: Phú Yên
Sinh ra ở Hải Phòng, làm thơ từ rất nhỏ, 11 tuổi được tặng giải nhất thơ cuộc thi “Chúng em
viết, vẽ về dân tộc anh hùng, sông núi vẻ vang” do báo Thiếu niên Tiền phong tổ chức.
Từ những năm 1970, Khánh Chi cùng với Trần Đăng Khoa được nhà thơ Xuân Diệu đánh giá là “hai hiện tượng nổi bật về các em nhỏ làm thơ”.
Gửi gió về cho nội là tập thơ Khánh Chi viết trong giai đoạn từ 7 đến 13 tuổi.

GIẢI THƯỞNG:
Một số giải thưởng về thơ của các báo Nhi đồng, Thiếu niên Tiền phong và Văn nghệ.', 36000)
INSERT [dbo].[Book] ([bid], [cid], [bname], [author], [image], [pid], [quantity], [describe], [price]) VALUES (28, N'2', N'Những Gã Khổng Lồ Xanh: Từ Doanh Nghiệp Bền Vững Đến Tập Đoàn Tỷ Đô', N'E. FREYA WILLIAMS', N'https://static-shop.waka.vn/resize/340x497x2/image/img.product/0/0/0/38/19586_1.jpg', N'1', 555, N'Những Gã Khổng Lồ Xanh: Từ Doanh Nghiệp Bền Vững Đến Tập Đoàn Tỷ Đô  Các doanh nghiệp tỷ đô như Tesla Motors, Trader Joe’s, Chipotle, Toyota, Unilever và General Electric có điểm gì chung? Họ đều đã thành công trong việc xây dựng các doanh nghiệp thành công đáng kinh ngạc khi bán các sản phẩm và dịch vụ giúp chúng ta sống hạnh phúc hơn, khỏe mạnh hơn, có ý thức hơn về môi trường. Với các nghiên cứu, các cuộc phỏng vấn độc quyền và ví dụ từ những tổ chức lớn, Những gã khổng lồ xanh tiết lộ cách những công ty nổi tiếng đã biến chiến lược bền vững và lợi ích xã hội thành một doanh nghiệp tỷ đô... và cách thức giúp bạn cũng có thể đạt được. Cuốn sách cung cấp một kế hoạch chi tiết cho thành công bền vững, xem xét sáu yếu tố chính mà những gã khổng lồ xanh chia sẻ đã trực tiếp góp phần vào thành công của họ. Mỗi chương trong cuốn sách sẽ bàn về từng đặc điểm.  Chương 1: Nhà Lãnh đạo phi truyền thống. Trong mỗi trường hợp, chúng ta đều có thể truy nguyên cuộc hành trình mang tên kinh doanh bền vững về một cá nhân, người khởi đầu cho tất cả. Chương này sẽ trình bày câu chuyện của những vị lãnh đạo đó, đồng thời phân tích 4C của Nhà lãnh đạo phi truyền thống.  Chương 2: Đổi mới Sáng tạo Đột phá. Mỗi dòng doanh thu của Gã Khổng Lồ Xanh không được xây dựng dựa trên một phiên bản xanh hơn một chút hay có trách nhiệm xã hội hơn một chút của một sản phẩm đã có sẵn, mà dựa trên một ý tưởng đổi mới sáng tạo có sức đột phá cả một lĩnh vực. Trong chương này, bạn sẽ biết những Gã Khổng Lồ Xanh làm như thế nào để cho ra đời những ý tưởng đổi mới sáng tạo theo định hướng phát triển bền vững, từ đó tạo ra những kết quả đột phá trong kinh doanh.  Chương 3: Mục đích Cao cả. Chương này tiết lộ về mục đích cao cả đã truyền cảm hứng và động lực cho những Gã Khổng Lồ Xanh, đồng thời phân tích về một phát hiện tưởng chừng như nghịch lý rằng những công ty ấp ủ một mục đích vượt ra ngoài khuôn khổ của lợi nhuận lại thường kiếm được nhiều lợi nhuận hơn so với đối thủ cạnh tranh.  Chương 4: Tích hợp, không phải thêm vào. Đối với những Gã Khổng Lồ Xanh, sự bền vững đồng nghĩa với kinh doanh. Chương này trình bày cách những Gã Khổng Lồ Xanh tích hợp sự bền vững vào sáu cấu trúc cốt lõi trong doanh nghiệp của họ để biến nó trở thành một động lực thúc đẩy doanh thu.  Chương 5: Thu hút Dòng chính. Nếu sản phẩm của bạn chỉ nhắm mục tiêu vào một thị trường ngách mà tôi gọi là Siêu Xanh, trong trường hợp này bạn sẽ rất khó đạt tới ngưỡng doanh thu 1 tỉ đô-la bởi vì phân khúc ngách đó không có đủ người nghiêm túc coi trọng các giá trị xanh để có thể giúp bạn hoàn thành được mục tiêu doanh thu trên. Đó cũng chính là điểm sai lầm của nhiều thương hiệu Xanh 1.0. Chương này tiết lộ những chiến lược mà những Gã Khổng Lồ Xanh sử dụng để tạo được sức hấp dẫn đối với các khách hàng hoặc người tiêu dùng dòng chính.  Chương 6: Hợp dồng hành vi mới. Minh bạch, trách nhiệm, hợp tác – những khái niệm thời thượng như thế này trong giới kinh doanh cũng được thể hiện rất sống động ở các Gã Khổng Lồ Xanh. Nhưng họ không chỉ dừng lại ở những lời nói suông. Ngày nay, danh tiếng của doanh nghiệp được xây dựng thông qua hành động chứ không dựa vào quảng cáo. Hành vi của bạn chính là thương hiệu của bạn. Chương này sẽ cho bạn biết các Gã Khổng Lồ Xanh hành xử như thế nào để đạt tới mức doanh thu hàng tỉ đô-la.  Mục lục:  Lời giới thiệu: Doanh nghiệp tỉ đô-la  1. Nhà lãnh đạo phi truyền thống  2. Đổi mới sáng tạo đột phá  3. Mục đích cao cả  4. Tích hợp, không phải thêm vào  5. Thu hút dòng chính  6. Một hợp đồng hành vi mới  Kết luận: Hiệu ứng những gã khổng lồ triển vọng và những gã khổng lồ xanh  Phụ lục: Phương pháp nghiên cứu được đề cập ở Chương 1', 127000)
INSERT [dbo].[Book] ([bid], [cid], [bname], [author], [image], [pid], [quantity], [describe], [price]) VALUES (29, N'1', N'Chủ Nghĩa Khắc Kỷ - Phong Cách Sống Bản Lĩnh Và Bình Thản', N' William B Irvine', N'https://static-shop.waka.vn/resize/340x497x2/image/img.product/0/0/0/39/19974_1.jpg', N'3', 222, N' chuyên nghiên cứu về lý thuyết hoặc lịch sử. Ngược lại, tôi quan tâm đến tính thực tiễn của chủ nghĩa Khắc kỷ: mục tiêu của tôi là áp dụng triết lý này vào cuộc sống của mình và khuyến khích người khác áp dụng nó vào cuộc sống của họ. Tôi cho rằng các triết gia Khắc kỷ cổ đại sẽ khuyến khích cả hai đường hướng này, nhưng họ cũng sẽ khẳng định rằng lý do chính để tìm hiểu về chủ nghĩa Khắc kỷ là nhằm áp dụng nó vào thực tiễn.  Điểm nữa cần hiểu rõ là mặc dù chủ nghĩa Khắc kỷ là một triết lý, nhưng nó cũng bao hàm cả yếu tố tâm lý. Các nhà Khắc kỷ nhận ra rằng một cuộc sống đầy rẫy cảm xúc tiêu cực – bao gồm tức giận, lo lắng, sợ hãi, đau buồn và ghen tị – không phải là một cuộc sống tốt đẹp. Do đó, họ trở thành những nhà quan sát nhạy bén về hoạt động của tâm trí con người và kết quả là trở thành một số nhà tâm lý học uyên bác nhất thời cổ đại. Họ tiếp tục phát triển các kỹ thuật để ngăn không cho các cảm xúc tiêu cực xuất hiện và để dập tắt chúng khi những nỗ lực ngăn chặn thất bại. Ngay cả những độc giả không tin tưởng phương pháp suy diễn của triết học cũng nên quan tâm đến các kỹ thuật này. Suy cho cùng, ai lại không muốn giảm bớt số lượng cảm xúc tiêu cực trong cuộc sống hằng ngày cơ chứ?  Mặc dù tôi đã nghiên cứu triết học trong suốt cả quãng đời trưởng thành, nhưng thực ra mãi cho đến thời gian gần đây, vốn kiến thức của tôi về chủ nghĩa Khắc kỷ vẫn còn nghèo nàn vô cùng. Các giảng viên đại học và cao học chưa từng yêu cầu tôi tìm đọc các triết gia Khắc kỷ, và mặc dù cũng ham đọc sách, nhưng tôi lại không có nhu cầu tìm đọc họ. Nhìn chung, tôi không có nhu cầu chiêm nghiệm về một triết lý sống nào cả. Thay vào đó, như hầu hết mọi người, tôi cảm thấy thoải mái với thứ triết lý sống mặc định: theo đuổi tiền tài, địa vị xã hội và lạc thú. Có thể xem triết lý sống của tôi là một dạng chủ nghĩa khoái lạc khai ngộ.  Thế nhưng, ở độ tuổi ngoài 40, dòng đời bắt đầu đưa đẩy tôi tiếp xúc với chủ nghĩa Khắc kỷ. Đầu tiên phải kể đến cuốn tiểu thuyết A Man in Full của Tom Wolfe xuất bản năm 1998. Trong truyện, một nhân vật tình cờ phát hiện ra triết gia Khắc kỷ Epictetus và sau đó luôn nhiệt tình trích dẫn triết lý sống của ông. Tôi thấy điều này vừa hấp dẫn lại vừa khó hiểu.  Hai năm sau, tôi bắt đầu tiến hành nghiên cứu để viết một cuốn sách về chủ đề ham muốn. Trong quá trình này, tôi xem xét những lời khuyên đã được đưa ra suốt hàng thiên niên kỷ qua về việc làm chủ ham muốn. Tôi bắt đầu tìm hiểu quan điểm của các tôn giáo về ham muốn, bao gồm Cơ Đốc giáo, Ấn Độ giáo, Đạo giáo, Sufi giáo và Phật giáo (nhất là Thiền tông). Tôi tiếp tục xem xét lời khuyên về cách làm chủ ham muốn của các triết gia phương Tây nhưng nhận thấy chỉ có một số ít người đề cập đến vấn đề này, nổi bật là các triết gia Hy Lạp cổ đại thuộc trường phái Epicurean, trường phái Hoài nghi và trường phái Khắc kỷ.  Thực ra, tôi có một động cơ sâu xa khi nghiên cứu về chủ đề ham muốn. Từ lâu tôi đã mến mộ Thiền tông và nghĩ rằng nếu chiêm nghiệm kỹ hơn về nó trong quá trình nghiên cứu, tôi có thể trở thành một Thiền sư thực thụ. Thế nhưng, tôi bất ngờ phát hiện ra một số điểm tương đồng giữa chủ nghĩa Khắc kỷ và Thiền tông. Chẳng hạn, cả hai đều nhấn mạnh tầm quan trọng của việc suy ngẫm về bản chất tạm thời của thế giới xung quanh chúng ta và tầm quan trọng của việc làm chủ ham muốn, trong giới hạn khả năng cho phép. Họ cũng khuyên chúng ta theo đuổi sự bình thản và đưa ra chỉ dẫn để đạt đến và duy trì được trạng thái này. Ngoài ra, tôi cũng nhận thấy chủ nghĩa Khắc kỷ phù hợp với bản tính ưa phân tích mọi sự của tôi hơn là Phật giáo. Kết quả là tôi nghĩ đến chuyện trở thành một người thực hành chủ nghĩa Khắc kỷ, thay vì là một người tu tập Thiền tông.  Trước khi bắt đầu nghiên cứu về ham muốn, đối với tôi, chủ nghĩa Khắc kỷ là một triết lý sống không thiết thực, nhưng khi đọc tác phẩm của các triết gia Khắc kỷ, hóa ra hầu hết mọi điều tôi từng biết về họ đều sai bét. Đầu tiên, tôi biết rằng từ điển định nghĩa một người Khắc kỷ là “người dường như lãnh đạm hoặc không bị ảnh hưởng bởi niềm vui, nỗi buồn, khoái lạc hay đau đớn”. Vì vậy, tôi tưởng họ là những người hay kìm nén cảm xúc. Thế nhưng, tôi khám phá ra rằng mục tiêu của chủ nghĩa Khắc kỷ không phải là loại trừ cảm xúc khỏi cuộc sống mà là loại trừ những cảm xúc tiêu cực.  Khi đọc các tác phẩm của chủ nghĩa Khắc kỷ, tôi bắt gặp những cá nhân vui vẻ và lạc quan về cuộc sống (mặc dù họ luôn dành thời gian để suy nghĩ đến tất cả những viễn cảnh tồi tệ có thể xảy ra với họ), những cá nhân có khả năng tận hưởng trọn vẹn những thú vui của cuộc sống (đồng thời cũng thận trọng để không trở thành nô lệ cho những thú vui đó). Ngạc nhiên làm sao, tôi cũng bắt gặp những cá nhân coi trọng niềm vui; quả thực, theo Seneca, điều mà các nhà Khắc kỷ cố gắng khám phá là “cách tâm trí có thể luôn luôn theo đuổi một lộ trình kiên định và thuận lợi, có khuynh hướng tích cực đối với chính nó, và nhìn nhận được các trạng thái của nó bằng niềm vui”. Ông cũng khẳng định rằng người thực hành các nguyên tắc Khắc kỷ “cần phải luôn, dù anh ta có muốn hay không, cảm thấy hân hoan và có một niềm vui sâu sắc phát xuất từ bên trong, bởi lẽ anh ta thích thú với những nguồn vui của riêng mình, và không hề khao khát niềm vui nào lớn hơn những niềm vui nội tại này”. Tương tự, triết gia Khắc kỷ Musonius Rufus nói rằng nếu sống theo những nguyên tắc Khắc kỷ thì chúng ta tất có được “tâm tính vui vẻ và niềm vui bền vững”.  Thay vì sống thụ động, nhẫn nhục cam chịu sự bất công và bạo hành của thế giới, các nhà Khắc kỷ đã nỗ lực trọn đời để biến thế giới thành một nơi tốt đẹp hơn. Chẳng hạn như Cato Trẻ, triết lý sống Khắc kỷ của Cato không hề ngăn cản ông dũng cảm đấu tranh để khôi phục nền Cộng hòa La Mã. (Tuy không đóng góp tác phẩm nào cho chủ nghĩa Khắc kỷ, nhưng Cato là một nhà Khắc kỷ; kỳ thực, Seneca xem ông là một nhà Khắc kỷ hoàn hảo.) Cũng vậy, Seneca dường như luôn tràn đầy nhiệt huyết: không chỉ là một triết gia, ông còn là một nhà soạn kịch thành công, cố vấn chính trị cho hoàng đế, và có thể xem là một chủ ngân hàng đầu tư vào thời đó. Và Marcus Aurelius, ông không chỉ là một triết gia mà còn là một hoàng đế La Mã – kỳ thực, ông được xem là một trong những hoàng đế La Mã vĩ đại nhất. Khi đọc về các nhà Khắc kỷ, tôi cảm thấy vô cùng thán phục họ. Họ dũng cảm, chừng mực, lý trí và kỷ ', 42242)
INSERT [dbo].[Book] ([bid], [cid], [bname], [author], [image], [pid], [quantity], [describe], [price]) VALUES (30, N'1', N'Lớp Học Tự Tin', N' Lee Jung Ho, Bang In Young', N'https://static-shop.waka.vn/resize/340x497x2/image/img.product/0/0/0/39/19975_1.jpg', N'1', 777, N'Lớp Học Tự Tin “Lớp học tự tin” Dành cho các bé từ độ tuổi 6+. Sách có độ dài vừa phải với nội dung thú vị và hấp dẫn, hình ảnh minh họa sống động giúp các bé thư giãn và học được nhiều bài học bổ ích về lòng tự tin.  Cuốn sách đưa ra những tình huống cụ thể mà các bạn nhỏ thường gặp phải đồng thời cũng nêu lên tâm trạng và cách xử lý cho từng tình huống đó. Mỗi khi rơi vào những hoàn cảnh khó xử khiến em mất tự tin, em phải suy nghĩ theo hướng nào, làm những gì để tâm trạng tốt lên? Cuốn sách sẽ đưa ra những gợi ý và phân tích để em hiểu hơn về các tình huống trong cuộc sống và từ đó, có cách ứng xử phù hợp và củng cố lòng tự tin của mình.  Trong học tập và giao tiếp hằng ngày, em có thường gặp những tình huống như thế này không?  Phải đứng trước mặt các bạn phát biểu, các bạn bảo rằng suy nghĩ của em sai, bạn bè chọc ghẹo khiến em cảm thấy bản thân đầy những nhược điểm…  Em đừng lo, cuốn sách này sẽ giúp em rèn kỹ năng phân tích vấn đề, giúp em hiểu được bản chất sự việc và đưa ra những cách ứng xử phù hợp nhất. Đồng thời, sách còn gợi ý những bài tập thực hành để em hiểu rõ bản thân và từ đó, trân quý bản thân hơn.  Với hình minh họa dễ thương, lời văn thân mật gần gũi, cuốn sách sẽ giống như một người bạn tâm tình cùng em trò chuyện. Từ chuyện trường lớp đến những việc trong gia đình, từ việc học tập đến những hoạt động ngoại khóa, mọi vấn đề đều có cách giải quyết và em sẽ thấy, lòng tự tin của mình tăng lên ngùn ngụt nhờ cuốn sách này!', 100000)
INSERT [dbo].[Book] ([bid], [cid], [bname], [author], [image], [pid], [quantity], [describe], [price]) VALUES (123456130, N'1', N'Cùng Nhau Sẽ Đi Xa Hơn (Tái bản 2020)', N'Simon Sinek', N'https://static-shop.waka.vn/resize/340x497x2/image/img.product/0/0/0/28/14840_1.jpg', N'5', 200, N'Cùng Nhau Sẽ Đi Xa Hơn (Tái bản 2018)  Cuốn sách được minh họa bằng những hình ảnh sống động và truyền cảm hứng theo một cách hoàn toàn mới với sự kết hợp của những câu trích dẫn truyền cảm hứng, lối kể chuyện và bình luận sâu sắc.  Cuốn sách kể về câu chuyện của ba người bạn – ba đứa trẻ sống ở một nơi rất ổn nhưng không được tuyệt cho lắm. Dù chúng có những khoảnh khắc hạnh phúc trên một sân chơi, nhưng giống như mọi đứa trẻ khác, chúng sống trong nỗi sợ của chiếc bóng “vị vua của sân chơi”. Cậu bé chỉ quan tâm đến bản thân mình và tình trạng của mình. Kết quả, những đứa trẻ kia cũng tự khiến bản thân dính vào nỗi sợ bị sự chú ý.  Qua câu chuyện, tác giả muốn truyền thông điệp rằng :  Một đội không phải là một nhóm người làm việc cùng nhau. Một đội là một nhóm người tin tưởng lẫn nhau. Và hành trình đến với sự nghiệp lãnh đạo lớn lao và có một sự nghiệp trọn vẹn không bao giờ là dễ dàng hay nhanh chóng. Nhiều người trong chúng ta may mắn tìm được một công việc có ý nghĩa, trong một môi trường mà chúng ta cảm thấy an toàn, vậy thì chúng ta cũng phải có trách nhiệm chia sẻ những lợi ích đó với càng nhiều người càng tốt.     Simon Sinek là tác giả và họa sĩ minh họa sống tại New York. Ông là người có niềm tin vô cùng lạc quan vào tương lai tương sáng của nhân loại. Bài nói chuyện của ông trên TED.com là bài nói được xem nhiều thứ 3 trong lịch sử của chương trình này. Ông đồng thời là đồng tác giả của 2 cuốn sách: Hãy bắt đầu với câu hỏi tại sao và Lãnh đạo luôn ăn sau cùng.', 63200)
INSERT [dbo].[Book] ([bid], [cid], [bname], [author], [image], [pid], [quantity], [describe], [price]) VALUES (123456132, N'1', N'Giải Nghiệm Cuộc Đời', N'Scott Galloway', N'https://static-shop.waka.vn/resize/340x497x2/image/img.product/0/0/0/38/19940_1.jpg', N'1', 2222, N'Giải Nghiệm Cuộc Đời  Làm sao để đạt được thành công? Làm cách nào để dung hòa giữa tham vọng và việc phát triển bản thân phù hợp với năng lực và đam mê?  Bạn có bao giờ hỏi bản thân nên làm gì ngay bây giờ để không phải hối tiếc khi bước qua tuổi 40, 50 hoặc 80?  Trên hành trình trưởng thành, nếu bạn gặp căng thẳng hay thậm chí u sầu, hãy ý thức rằng đây là một giai đoạn rất bình thường và tiếp tục tiến về phía trước. Hạnh phúc đang chờ bạn.  Tác giả Scott Galloway trong cuốn sách “Giải nghiệm cuộc đời” đã chia sẻ quan sát của mình với tư cách một doanh nhân thành công với nhiều công ty khởi nghiệp, một nhà nghiên cứu, một người chồng, người cha cũng như một đứa con, và còn là một người đàn ông Mỹ. Ông đã tổ chức buổi học cuối khóa kéo dài ba giờ với tên gọi “Phương trình Hạnh phúc”. Xuyên suốt buổi học, ông đã bóc tách các khái niệm thành công, tình yêu và một cuộc đời đáng sống.  Giải nghiệm cuộc đời gồm 4 phần:  Phần đầu tiên phác thảo những phương trình cơ bản mà tác giả và sinh viên của ông cùng nhau ôn lại vào mỗi mùa xuân: Nếu bí quyết tạo ra hạnh phúc được quy về một số lượng phương trình hữu hạn, chúng sẽ là gì?  Phần thứ hai khai thác sâu vào những gì Scot Galloway đã học được về thành công, hoài bão, sự nghiệp và tiền bạc từ kinh nghiệm bản thân với tư cách là nhân viên ngân hàng đầu tư, doanh nhân, giáo sư trường kinh doanh, đồng thời là tiếng nói chỉ ra tác động của các ông trùm công nghệ lên nền kinh tế và xã hội.  Phần ba – tình yêu và các mối quan hệ – lại sâu sắc hơn cả. Những người trẻ, đặc biệt là cánh đàn ông, đang phải vật lộn chắp vá những thông điệp hỗn loạn về cách gìn giữ các mối quan hệ và chinh phục thành công, để từ đó giành cho mình một chỗ đứng trong xã hội tư bản.  Phần thứ tư, cũng là phần cuối cùng, thách thức người đọc đối diện và giải quyết những vấn đề của bản thân, bao gồm việc nuôi dưỡng và chăm sóc sức khỏe thể chất, mặt tối của tâm hồn, cũng như những ngày cuối cùng nơi trần thế.', 22222)
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
INSERT [dbo].[Category] ([cid], [cname]) VALUES (N'1', N'Sách Kĩ Năng')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (N'2', N'Sách Kinh Doanh')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (N'3', N'Sách Văn Học')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (N'4', N'Sách Thiếu Nhi')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (N'5', N'Sách Văn Hoá - Xã Hội')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (N'6', N'Sách Kĩ Thuật')
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([oid], [aid], [date], [total]) VALUES (1, 12, CAST(N'2022-11-09' AS Date), 160000)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[Publisher] ([pid], [pname]) VALUES (N'1', N'Thế giới')
INSERT [dbo].[Publisher] ([pid], [pname]) VALUES (N'2', N'Quân Đội')
INSERT [dbo].[Publisher] ([pid], [pname]) VALUES (N'3', N'Thanh Niên')
INSERT [dbo].[Publisher] ([pid], [pname]) VALUES (N'4', N'Kim Đồng')
INSERT [dbo].[Publisher] ([pid], [pname]) VALUES (N'5', N'Dân Trí')
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Categories] FOREIGN KEY([cid])
REFERENCES [dbo].[Category] ([cid])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Categories]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_PublisherID] FOREIGN KEY([pid])
REFERENCES [dbo].[Publisher] ([pid])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_PublisherID]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Account] FOREIGN KEY([aid])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Account]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Book] FOREIGN KEY([bid])
REFERENCES [dbo].[Book] ([bid])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Book]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([oid])
REFERENCES [dbo].[Order] ([oid])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
USE [master]
GO
ALTER DATABASE [PRJ301] SET  READ_WRITE 
GO
