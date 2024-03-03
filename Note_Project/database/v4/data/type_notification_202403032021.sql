INSERT INTO public.type_notification (id,name,note,status,created_at,updated_at,color,code) VALUES
	 (8,'Hệ thống báo lỗi','hệ thống gửi thông báo lỗi dành cho người dùng',true,'2023-09-23 22:18:15.891562','2023-10-04 22:49:45.843923','ff0000','SYSTEM'),
	 (9,'Thông báo','Hệ thống gửi thông báo lỗi dành cho người dùng',true,'2023-09-23 22:16:33.68393','2023-10-04 22:49:45.860041','F4E869','EVENT'),
	 (10,'Người dùng','Thông báo từ người dùng , người dùng gửi thông báo đến người dùng',true,'2023-09-23 22:19:06.398984','2023-10-04 22:49:45.860989','3085C3','CUSTOMER'),
	 (11,'Phản hồi ','Phản hồi từ những ý kiễn phản hồi cho khách hàng',true,'2023-09-23 22:19:57.710001','2023-10-04 22:49:45.861501','6c757d','RESPONSE'),
	 (12,'Gửi','gửi tin nhắn , phản hồi cho khách hàng thành công',true,'2023-09-23 22:20:34.3712','2023-10-04 22:49:45.861972','28a745','SEND'),
	 (13,'Cảnh báo ','gửi cảnh báo cho người dùng',true,'2023-09-23 22:21:07.651394','2023-10-04 22:49:45.86269','E9B824','WARNING');
