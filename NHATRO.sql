
CREATE DATABASE QLNHATRO_Thuyldpc02874
GO 
USE QLNHATRO_Thuyldpc02874 
GO

CREATE TABLE LoaiNha(
	MaLoaiNha VARCHAR(10) PRIMARY KEY,
	TenLoaiNha NVARCHAR(50) NOT null
)

CREATE TABLE NguoiDung(
	MaNguoiDung VARCHAR(10) PRIMARY KEY,
	TenNguoiDung NVARCHAR(50) NOT NULL,
	GioiTinh NVARCHAR(5) CHECK(GioiTinh =N'Nam' OR GioiTinh= N'Nữ') NOT NULL,
	DienThoai VARCHAR(15) NOT NULL UNIQUE,
	DiaChi NVARCHAR(100) NOT NULL,
	Quan NVARCHAR(50) NOT NULL,
	Email VARCHAR(50) NOT NULL UNIQUE
)
--Tạo Bảng Nhà Trọ
SELECT * FROM NhaTro
CREATE TABLE NhaTro(
	MaNhaTro VARCHAR(10) PRIMARY KEY,
	MaLoaiNha VARCHAR(10) REFERENCES dbo.LoaiNha (MaLoaiNha),
	DienTich FLOAT CHECK(DienTich > 0) NOT NULL,
	GiaPhong MONEY CHECK(GiaPhong >0) NOT NULL,
	DiaChi NVARCHAR(100) NOT NULL,
	Quan NVARCHAR(50) NOT NULL,
	MoTa NVARCHAR(100) NOT NULL,
	MaNguoiDung VARCHAR(10) REFERENCES dbo.NguoiDung(MaNguoiDung)
)
--Tạo Bảng Đánh Giá
CREATE TABLE DanhGia(
	MaNguoiDung VARCHAR(10) REFERENCES dbo.NguoiDung(MaNguoiDung),
	MaNhaTro VARCHAR(10) REFERENCES dbo.NhaTro(MaNhaTro),
	DanhGia BIT NOT NULL,
	NoiDungDanhGia NVARCHAR(100) NOT NULL,
	PRIMARY KEY(MaNguoiDung,MaNhaTro)
)
----------DỮ LIỆU MẪU-----
-------Y2------------
--Thêm Dữ liệu bảng LoaiNha
INSERT INTO LOAINHA VALUES
		('LN001',N'Nhà trọ chung chủ'),
		('LN002',N'Nhà trọ tự quản lý'),
		('LN003',N'Chung cư'),
		('LN004',N'Homestay'),
		('LN005',N'Ký túc xá')
GO
--Thêm Dữ Liệu Bảng NguoiDung
SELECT * FROM dbo.NGUOIDUNG
--DELETE dbo.NGUOIDUNG
INSERT INTO NGUOIDUNG VALUES
		('N001',N'Lâm Diễm Thúy',N'Nữ','0919993715',N'140 Huỳnh Văn Bánh, Phường 12',N'Phú Nhuận','duy@gmail.com'),
		('N002',N'Nguyễn Đình Dũng',N'Nam','0123456789',N'370 Lê Văn Lương, Phường Tân Hưng',N'Quận 7','dung@gmail.com'),
		('N003',N'Mai Văn Đạt',N'Nam','0164846138',N'113 Cộng Hoà, Phường 12',N'Tân Bình','dat@gmail.com'),
		('N004',N'Phạm Lan Hương',N'Nữ','0894153484',N'150 Trường Chinh, Phường 12',N'Tân Bình','huong@gmail.com'),
		('N005',N'Huỳnh Văn Tiến',N'Nam','0345451245',N'233 Đinh Bộ Lĩnh, Phường 26',N'Bình Thạnh','tien@gmail.com'),
		('N006',N'Trần Tuấn Kiệt',N'Nam','0324444517',N'379 Huỳnh Tấn Phát, Phường Tân Thuận Đông',N'Quận 7','kiet@gmail.com'),
		('N007',N'Phan Ngọc Thu',N'Nữ','0789114256',N'29 Nguyễn Trung Ngạn, Phường Bến Nghé',N'Quận 1','thu@gmail.com'),
		('N008',N'Trần Trung Kiên',N'Nam','0412454359',N'496 Nguyễn Đình Chiểu, Phường 4',N'Quận 3','kien@gmail.com'),
		('N009',N'Nguyễn Thị Thục Oanh',N'Nữ','0178811561',N'124 Nam Kỳ Khởi Nghĩa, Phường Bến Thành',N'Quận 1','oanh@gmail.com'),
		('N010',N'Phạm Thanh Huyền',N'Nữ','0365841258',N'01 Lương Định Của, Phường An phú',N'Quận 2','hien@gmail.com'),
		('N011',N'Phan Văn Đức',N'Nam','0685596317',N'139 Dương Bá Trạc, Phường 1',N'Quận 8','duc@gmail.com')
GO
--Thêm Dữ Liệu Bảng Nhà Trọ
SELECT * FROM dbo.NhaTro

INSERT INTO NHATRO VALUES
		('NT001','LN001',25.5,1000000,N'Thống Nhất, Phường 16',N'Gò Vấp',N'Cho thuê','02-12-2021','N001'),
		('NT002','LN002',30,5000000,N'4 Trần Khắc Chân, Tân Định',N'Quận 1',N'Mặt bằng đẹp','10-02-2021','N002'),
		('NT003','LN002',40,2000000,N'27B Hoa Sứ, Phường 7',N'Phú Nhuận',N'Ngõ rộng','05-01-2021','N003'),
		('NT004','LN004',100,3500000,N'Lê Tự Tài, Phường 4',N'Phú Nhuận',N'Cho thuê nguyên căn','08-25-2021','N004'),
		('NT005','LN003',50,1700000,N'793 Trần Xuân Soạn, Tân Hưng',N'Quận 7',N'Cho thuê dài hạn','11-23-2021','N005'),
		('NT006','LN005',60,6000000,N'215 Nguyễn Văn Hưởng, Thảo Điền',N'Quận 2',N'Lối đi thông thoáng','03-01-2021','N006'),
		('NT007','LN001',35,4300000,N'930 Nguyễn Thị Định, Thạnh Mỹ Lợi',N'Quận 2',N'Cho thuê','10-18-2021','N007'),
		('NT008','LN001',45,4700000,N'31 Bình Phú, Phường 10',N'Quận 6',N'Cho thuê dài hạn','09-14-2021','N008'),
		('NT009','LN002',70,7200000,N'21 Đỗ Thúc Tịnh, Phường 12',N'Gò Vấp',N'Giá cả phải chăng','05-29-2021','N009'),
		('NT010','LN003',65,2500000,N'Bùi Đình Túy, Phường 24',N'Bình Thạnh',N'Cho thuê','11-26-2021','N010'),
		('NT011','LN005',40,4600000,N'174 Tân Hòa Đông, Phường 14',N'Quận 6',N'Cho thuê','03-06-2021','N011'),
		('NT012','LN001',85,8800000,N'Nguyễn Thị Thập, Bình Thuận',N'Quận 7',N'Ngõ rộng','07-12-2021','N002'),
		('NT013','LN002',70,2800000,N'243 Chu Văn An, Phường 12',N'Bình Thạnh',N'Giá cả phải chăng','04-22-2021','N001'),
		('NT014','LN004',50,3100000,N'Nguyễn Trãi, Nguyễn Cư Trinh',N'Quận 1',N'Ngõ rộng','01-12-2021','N001'),
		('NT015','LN005',20,6500000,N'63/39 Lê Văn Sỹ, Phường 11',N'Phú Nhuận',N'Cho thuê dài hạn','06-07-2021','N005')
GO

--THÊM DỮ LIỆU BẢNG ĐÁNH GIÁ
SELECT * FROM DanhGia

INSERT INTO DANHGIA VALUES
		('N001','NT002','1',N'Nhà trọ tốt'),
		('N002','NT003','0',N'Giá cao'),
		('N003','NT003','1',N'Nhà trọ tốt'),
		('N005','NT001','1',N'Cổng cao'),
		('N005','NT004','0',N'Xuống cấp'),
		('N001','NT005','0',N'Giá cao'),
		('N007','NT003','0',N'Đường xấu'),
		('N008','NT007','1',N'Nhà đẹp'),
		('N009','NT009','0',N'Mạng kém'),
		('N010','NT005','1',N'Ngõ rộng'),
		('N010','NT010','1',N'Giá cao'),
		('N010','NT009','1',N'Nhà đẹp'),
		('N011','NT008','1',N'Giá tốt'),
		('N001','NT011','0',N'Cổng thấp'),
		('N002','NT004','1',N'Thoáng mát')
GO
