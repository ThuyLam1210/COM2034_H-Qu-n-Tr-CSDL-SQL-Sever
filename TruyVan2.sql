

-- 1. Tạo bảng loainha
CREATE TABLE LOAINHA(
	MaLoaiNha VARCHAR(10) PRIMARY KEY,
	TenLoaiNha nvarchar(50) NOT NULL
)
GO
--DROP TABLE NGUOIDUNG
-- 2. Tạo bảng nguoidung
CREATE TABLE NGUOIDUNG(
	MaNguoiDung VARCHAR(10) PRIMARY KEY,
	TenNguoiDung NVARCHAR(50) NOT NULL,
	GioiTinh NVARCHAR(5) NOT NULL CHECK (GioiTinh = N'Nam' OR GioiTinh = N'Nữ'),
	DienThoai varchar(15) NOT NULL UNIQUE,
	DiaChi nvarchar(100) NOT NULL,
	Quan nvarchar(50) NOT NULL,
	Email varchar(50) UNIQUE 
)
GO

-- 3. Tạo bảng nhatro
CREATE TABLE NHATRO(
	MaNhaTro VARCHAR(10) PRIMARY KEY,
	MaLoaiNha VARCHAR(10) REFERENCES LOAINHA(MaLoaiNha),
	DienTich float check(DienTich > 0) NOT NULL,
	GiaPhong MONEY check(GiaPhong > 0) NOT NULL,
	DiaChi nvarchar(50) NOT NULL,
	Quan nvarchar(20),
	MoTa nvarchar(20) NOT NULL,
	NgayDangTin date NOT NULL,
	MaNguoiDung VARCHAR(10) REFERENCES NGUOIDUNG(MaNguoiDung)
)
GO


-- 4. Tạo bảng danhgia
CREATE TABLE DANHGIA(
	MaNguoiDung VARCHAR(10) references NGUOIDUNG(MaNguoiDung),
	MaNhaTro VARCHAR(10) references NHATRO(MaNhaTro),
	DanhGia bit NOT NULL,
	NoiDungDanhGia nvarchar(100) NOT NULL,
	PRIMARY KEY(MaNguoiDung,MaNhaTro)
)
GO

----Y2------------
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
SELECT * FROM dbo.LOAINHA

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
SELECT * FROM dbo.DANHGIA

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


USE QL_NhaTro
GO
--TRUY VẤN DỮ LIỆU
--Y3.1.a
--SP thứ nhất thực hiện chèn dữ liệu vào bảng NGUOIDUNG
-- DROP PROC sp_NguoiDung_insert
SELECT * FROM dbo.NGUOIDUNG
IF OBJECT_ID('sp_NguoiDung_insert') IS NOT NULL
	DROP PROC sp_NguoiDung_insert
GO
CREATE PROC sp_NguoiDung_insert
	@MaNguoiDung VARCHAR(10),
	@TenNguoiDung nvarchar(50),
	@GioiTinh NVARCHAR(5),
	@DienThoai varchar(15),
	@DiaChi nvarchar(100),
	@Quan nvarchar(50),
	@Email varchar(50)
AS
	IF (@MaNguoiDung IS NULL OR @MaNguoiDung LIKE '')
		BEGIN 
			PRINT N'Chưa Nhập Mã Người Dùng!'
			RETURN
		end
	ELSE IF @MaNguoiDung IN (SELECT MaNguoiDung FROM dbo.NGUOIDUNG)
		BEGIN 
			PRINT N'Mã Người Dùng Đã Tồn Tại!'
			RETURN
		END
    ELSE IF(@TenNguoiDung IS NULL OR @TenNguoiDung LIKE '')
		BEGIN 
			PRINT N'Chưa Nhập Tên Người Dùng'
			RETURN
          END
	ELSE IF (@GioiTinh IS NULL OR @GioiTinh LIKE '')
		BEGIN 
			PRINT	N'Chưa Nhập Giới Tính!'
			return
		END
     ELSE IF (@DienThoai IS NULL OR @DienThoai LIKE '')
		BEGIN 
			PRINT	N'Chưa Nhập Số Điện Thoại!'
			return
		END
		ELSE IF @DienThoai IN (SELECT DienThoai FROM dbo.NGUOIDUNG)
			BEGIN 
				PRINT N'Số Điện Thoại Không Được Nhập Trùng!'
				return
			END
		ELSE IF (@DiaChi IS NULL OR @DiaChi LIKE '')
		BEGIN 
			PRINT N'Chưa Nhập Địa Chỉ!'
			return
		END
		ELSE IF (@Quan IS NULL OR @Quan LIKE '')
			BEGIN 
				PRINT N'Chưa Nhập Địa Chỉ!'
				return
			END
		ELSE IF (@Email IS NULL OR @Email LIKE '')
			BEGIN 
				PRINT N'Chưa Nhập Email!'
				return
			END
		ELSE IF @Email IN (SELECT Email FROM dbo.NGUOIDUNG)
			BEGIN 
				PRINT N'Email Không Được Nhập Trùng!'
				return
			END
	ELSE 
		BEGIN
			INSERT INTO NGUOIDUNG VALUES (@MaNguoiDung,@TenNguoiDung,@GioiTinh,@DienThoai,@DiaChi,@Quan,@Email)
			PRINT N'Thêm Dữ Liệu Thành Công!'
		END
	go
--3. thực thi

EXEC dbo.sp_NguoiDung_insert @MaNguoiDung = 'a',   -- varchar(10)
                             @TenNguoiDung = N'a', -- nvarchar(50)
                             @GioiTinh = N'ac',     -- nvarchar(5)
                             @DienThoai = '',     -- varchar(15)
                             @DiaChi = N'',       -- nvarchar(100)
                             @Quan = N'',         -- nvarchar(50)
                             @Email = ''          -- varchar(50)

--4. Truy vấn lại xem có dữ liệu không
SELECT * FROM NGUOIDUNG
GO

--Y3.1.b
--SP thứ hai thực hiện chèn dữ liệu vào bảng NHATRO
-- DROP PROC sp_NhaTro_insert
SELECT * FROM dbo.NHATRO
IF OBJECT_ID('sp_NhaTro_insert') IS NOT NULL
	DROP PROC sp_NhaTro_insert
GO 
CREATE PROC sp_NhaTro_insert
	@MaLoaiNha int,
	@DienTich real,
	@GiaPhong money,
	@Quan nvarchar(50),
	@ThongTinNhaTro nvarchar(50),
	@NgayDang date
AS
BEGIN
	INSERT INTO NHATRO VALUES(@MaLoaiNha,@DienTich,@GiaPhong,@Quan,@ThongTinNhaTro,@NgayDang)
END
go
-- thi hành
EXEC sp_NhaTro_insert 4,50.6,5000000,N'Quận 12',N'Cho Thuê','11-22-2020'
go
SELECT * FROM NHATRO
go

--Y3.1.c
--SP thứ ba thực hiện chèn dữ liệu vào bảng DANHGIA
---- viết store insert value danhGia
-- DROP PROC sp_DanhGia_insert 
CREATE PROC sp_DanhGia_insert 
	@MaNhaTro int,
	@MaNguoiDung int,
	@DanhGia bit,
	@ThongTinDanhGia nvarchar(50)
AS
BEGIN
	INSERT INTO DANHGIA VALUES(@MaNhaTro,@MaNguoiDung ,@DanhGia ,@ThongTinDanhGia)
END
go
-- thi hành
EXEC sp_DanhGia_insert 4,7,'1',N'Giá hợp lí'
go
SELECT * FROM DANHGIA
go


--Y3.2.a
-- Viết một SP với các tham số đầu vào phù hợp. SP thực hiện tìm kiếm thông tin các
-- phòng trọ thỏa mãn điều kiện tìm kiếm theo: Quận, phạm vi diện tích, phạm vi ngày đăng
-- tin, khoảng giá tiền, loại hình nhà trọ.
--SELECT * FROM dbo.NHATRO
if OBJECT_ID('sp_NhaTro_select') is not null
	DROP PROC sp_NhaTro_select
	go
CREATE PROC sp_NhaTro_select
	@Quan nvarchar(50) = N'%',
	@LoaiNhaTro nvarchar(50) = N'%',
	@DienTichMax FLOAT = null,
	@DienTichMin FLOAT = null,
	@NgayDangMax date = null,
	@NgayDangMin date = null,
	@GiaPhongMax money = null,
	@GiaPhongMin money = null
as
	if (@DienTichMax is null)
	BEGIN
		SELECT @DienTichMax = MAX(DienTich) from NHATRO
	END
	ELSE IF (@DienTichMin is null)
	BEGIN
		SELECT @DienTichMin = Min(Dientich) from NHATRO
	END
	ELSE IF (@NgayDangMax is null)
	BEGIN
		SELECT @NgayDangMax = MAX(NHATRO.NgayDangTin) from NHATRO
	END
	 ELSE IF (@NgayDangMin is null)
	BEGIN
		SELECT @NgayDangMin = MIN(NHATRO.NgayDangTin) from NHATRO
	END
	ELSE IF (@GiaPhongMax is null)
	BEGIN
		SELECT @GiaPhongMax = MAX(NHATRO.GiaPhong) from NHATRO
	END
	ELSE IF (@GiaPhongMin is null)
	BEGIN
		SELECT @GiaPhongMin = MIN(NHATRO.GiaPhong) from NHATRO
	END
SELECT (N'Cho thuê phòng tại '+NhaTro.DiaChi+', '+NhaTro.Quan) as 'Địa Chỉ',
	(FORMAT(DienTich,'N','vi-VN') + ' m2') as 'Diện Tích',
	(FORMAT(GiaPhong,'N','vi-VN') + N' VNĐ') as 'Giá Phòng',
	NhaTro.MoTa as 'Thông Tin Nhà Trọ',
	CONVERT(varchar,NgayDangTin,105) as 'Ngày Đăng',
	CASE NGUOIDUNG.GioiTinh
	when N'Nam' then 'A. ' + NGUOIDUNG.TenNguoiDung
	when N'Nữ' then 'C. ' + NGUOIDUNG.TenNguoiDung
	END as N'Người đăng',
	DienThoai as N'Điện thoại liên hệ',
	(NGUOIDUNG.DiaChi + ', ' + NGUOIDUNG.Quan) as N'Địa chỉ liên hệ'
	FROM NHATRO
	JOIN LOAINHA on NhaTro.MaLoaiNha = LoaiNha.MaLoaiNha
	JOIN NGUOIDUNG on NhaTro.MaNguoiDung = NGUOIDUNG.MaNguoiDung
WHERE (DienTich <= @DienTichMax)
	AND (DienTich >= @DienTichMin)
	AND (NgayDangTin <= @NgayDangMax)
	AND (NgayDangTin >= @NgayDangMin)
	AND (GiaPhong <= @GiaPhongMax)
	AND (GiaPhong >= @GiaPhongMin)
	AND (NHATRO.Quan LIKE @Quan)
	AND (LOAINHA.TenLoaiNha LIKE @LoaiNhaTro)
ORDER BY NgayDangTin
--Truy vấn
EXEC sp_NhaTro_select
SELECT * FROM dbo.NHATRO
SELECT * FROM dbo.LOAINHA JOIN dbo.NHATRO ON NHATRO.MaLoaiNha = LOAINHA.MaLoaiNha
EXEC sp_NhaTro_select @LoaiNhaTro = N'%Chung cư%'
EXEC sp_NhaTro_select @Quan = N'%Quận l%', @DienTichMax = 60, @GiaPhongMax = 4000000
EXEC sp_NhaTro_select @NgayDangMax = '7/30/2013', @NgayDangMin = 'l/1/2013'


--Y3.2.b
--Hàm trả về mã người dùng
if OBJECT_ID('fn_MaNguoiDung') is not null
drop function fn_MaNguoiDung
go
create function fn_MaNguoiDung(
	@TenNguoiDung nvarchar(50) = N'%',
	@Dienthoai nvarchar(50) = N'%',
	@DiaChi nvarchar(50) = N'%',
	@Quan nvarchar(50) = N'%')
returns table
return (select MaNguoiDung
		from NguoiDung
		where (TenNguoiDung like @TenNguoiDung)
		and (Diachi like @Diachi)
		and (Quan like @Quan)
		and (Dienthoai like @Dienthoai) )
---Truy vấn
select * from dbo.fn_MaNguoiDung(N'%Nguyễn%', default, default, default)

--Y3.2.c
--Hàm trả về tổng số Like
if OBJECT_ID ('fn_TongLike') is not null
drop function fn_TongLike
go
create function fn_TongLike(@MaNhaTro int)
returns int
as
begin
	return (select count(DanhGia) from DANHGIA
		where MaNhaTro = @Manhatro
		and DanhGia = 1)
end
---Truy vấn
--select dbo.fn_TongLike (3)

--Hàm trả về tổng số Dislike
if OBJECT_ID ('fn_TongDislike') is not null
drop function fn_TongDislike
go
create function fn_TongDislike(@MaNhaTro int)
returns int
as
begin
	return (select count(DanhGia) from DANHGIA
		where MaNhaTro = @MaNhaTro
		and DanhGia = 0)
end
---Truy vấn
select MaNhaTro,TenLoaiNha,
	(REPLACE(CONVERT(varchar,DienTich,103),'.',',') + ' m2') as 'Diện Tích',
	(REPLACE(LEFT(CONVERT(varchar,GiaPhong,1),LEN(CONVERT(varchar,GiaPhong,1))-3),',','.') + N' VNĐ') as N'Giá Phòng',
	(NHATRO.DiaChi+', '+NHATRO.Quan) as N'Địa Chỉ',
	dbo.fn_TongLike(MaNhaTro) as N'Tổng Like',
	dbo.fn_TongDislike(MaNhaTro) as N'Tổng Dislike',
	MoTa as N'Thông Tin Nhà Trọ',
	NgayDangTin as N'Ngày Đăng',
	NGUOIDUNG.TenNguoiDung as 'Người Đăng'
from NHATRO
join NGUOIDUNG on NHATRO.MaNguoiDung = NGUOIDUNG.MaNguoiDung
join LOAINHA on NHATRO.MaLoaiNha = LOAINHA.MaLoaiNha

--Y3.3.d
--View top 5 nhà trọ được like nhiều nhất
if OBJECT_ID ('Top5') is not null
drop view Top5
go
create view Top5
as
select TOP 5 NHATRO.MaNhaTro as 'Mã nhà trọ',
	(REPLACE(CONVERT(varchar,DienTich,103),',',',') +' m2') as 'Diện Tích',
	(REPLACE(LEFT(CONVERT (varchar,GiaPhong,1),LEN(CONVERT(varchar,GiaPhong,1))-3),',','.') + N' VNĐ') as 'Giá Phòng',
	MoTa as 'Thông Tin Nhà Trọ',
	(NHATRO.DiaChi +', '+ NHATRO.Quan) as 'Địa chỉ nhà trọ',
	dbo.fn_TongLike(MaNhaTro) as 'Tổng Like',
	NgayDangTin as 'Ngày Đăng',
	NGUOIDUNG.TenNguoiDung as 'Người Đăng',
	(NGUOIDUNG.DiaChi +', '+ NGUOIDUNG.Quan) as 'Địa chỉ liên hệ',
	NGUOIDUNG.DienThoai as 'Điện thoại',
	NGUOIDUNG.Email as "Email"
from NHATRO
join NGUOIDUNG on NHATRO.MaNguoiDung = NGUOIDUNG.MaNguoiDung
join LOAINHA on NHATRO.MaLoaiNha = LOAINHA.MaLoaiNha
order by N'Tổng Like' DESC
---Truy vấn
select * from Top5

--Y3.3.e
--Truy vấn thông tin đánh giá nhà trọ
if OBJECT_ID ('sp_DanhGiaNhatro_select') is not null
drop proc sp_DanhGiaNhatro_select
go
create proc sp_DanhGiaNhatro_select
@MaNhaTro int
as
if not exists (select * from NHATRO where MaNhaTro = @Manhatro)
	begin
		print N'Nhà trọ này không tồn tại'
	end
else
	begin
		if not exists (select * from DanhGia where Manhatro = @Manhatro)
			begin
				print N'Nhà trọ này chưa được đánh giá'
			end
		else
			begin
				select DANHGIA.MaNhaTro as 'Mã nhà trọ',
				NGUOIDUNG.TenNguoiDung as 'Người đánh giá',
				case DANHGIA.DanhGia
					when 1 then 'Like'
					when 0 then 'Dislike'
				end as N'Đánh giá',
				DANHGIA.NoiDungDanhGia as 'Nội dung đánh giá'
				from DANHGIA
				join NGUOIDUNG on DANHGIA.MaNguoiDung = NGUOIDUNG.MaNguoiDung
				where DANHGIA.MaNhaTro = @Manhatro
			end
	end
--Truy vấn
exec sp_DanhGiaNhatro_select @MaNhaTro = 1
exec sp_DanhGiaNhatro_select @MaNhaTro = 2
exec sp_DanhGiaNhatro_select @ManhaTro = 3
exec sp_DanhGiaNhatro_select @MaNhaTro = 4
exec sp_DanhGiaNhatro_select @MaNhaTro = 5
exec sp_DanhGiaNhatro_select @ManhaTro = 6
exec sp_DanhGiaNhatro_select @MaNhaTro = 7
exec sp_DanhGiaNhatro_select @MaNhaTro = 8
exec sp_DanhGiaNhatro_select @MaNhaTro = 9
exec sp_DanhGiaNhatro_select @MaNhaTro = 10
--truy vấn nhà trọ chưa có đánh giá
exec sp_DanhGiaNhatro_select @ManhaTro = 14
--truy vấn nhà trọ không tồn tại
exec sp_DanhGiaNhatro_select @MaNhaTro = 16



--Y3.3.1
--Xóa thông tin nhà trọ theo số lượng Dislike
if OBJECT_ID ('sp_delete_NhaTro_Dislike') is not null
drop proc sp_NhaTro_Dislike_delete
go
CREATE PROC sp_NhaTro_Dislike_delete
@Dislike int
as
begin try
	begin tran
		--save tran A
			declare @Manhatro table (MaNhaTro int)
				insert @Manhatro
				select NHATRO.MaNhaTro from NHATRO where dbo.fn_TongDislike (NHATRO.MaNhaTro) > @Dislike
			delete from DANHGIA
				where DANHGIA.MaNhaTro in (select MaNhaTro from @Manhatro)
			delete from Nhatro
				where NHATRO.MaNhaTro in (select MaNhaTro from @Manhatro)
			print N'Thao tác thành công!'
		--rollback tran A
	commit tran
end try
begin catch
	rollback tran
	print N'Thao tác không thành công!'
end catch
-----
EXEC sp_NhaTro_Dislike_delete @Dislike = 2

--Y3.3.2
if OBJECT_ID ('sp_NhaTro_NgayDang_delete') is not null
DROP PROC sp_NhaTro_NgayDang_delete
go
CREATE PROC sp_NhaTro_NgayDang_delete
@NgayDangMin date = null,
@NgayDangMax date = null
as
begin try
	begin tran
		--save tran A
			if (@NgayDangMax is null)
				select @NgayDangMax = MAX (NHATRO.NgayDangTin) from NHATRO
			if (@NgayDangMin is null)
				select @NgayDangMin = Min (NHATRO.NgayDangTin) from NHATRO
			declare @Manhatro table (MaNhaTro int)
				insert @MaNhatro
				select NHATRO.MaNhaTro from NHATRO
			where (NgayDangTin <= @NgayDangMax) and (NgayDangTin >= @NgayDangMin)
			--exec sp_select_NhaTro
			delete from DanhGia
				where DanhGia.MaNhaTro in (select MaNhaTro from @Manhatro)
			delete from NhaTro
				where NHATRO.MaNhaTro in (select Manhatro from @Manhatro)
			--exec sp_select_NhaTro
			print N'Thao tác thành công!'
		--rollback tran A
	commit tran
end try
begin catch
	rollback tran
	print N'Thao tác không thành công!'
end catch
-----
EXEC sp_NhaTro_NgayDang_delete @NgayDangMin='1/1/2013',@NgayDangMax='12/31/2013'