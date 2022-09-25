

----Y3---------------
/*1. Thêm thông tin vào các bảng
- Tạo ba Stored Procedure (SP) với các tham số đầu vào phù hợp.
o SP thứ nhất thực hiện chèn dữ liệu vào bảng NGUOIDUNG
o SP thứ hai thực hiện chèn dữ liệu vào bảng NHATRO
o SP thứ ba thực hiện chèn dữ liệu vào bảng DANHGIA
Yêu cầu đối với các SP: Trong mỗi SP phải kiểm tra giá trị các tham số đầu vào. Với 
các cột không chấp nhận thuộc tính NULL, nếu các tham số đầu vào tương ứng với 
chúng không được truyền giá trị, thì không thực hiện câu lệnh chèn mà in một thông báo
yêu cầu người dùng nhập liệu đầy đủ.
- Với mỗi SP, viết hai lời gọi. Trong đó, một lời gọi thực hiện chèn thành công dữ liệu,
và một lời gọi trả về thông báo lỗi cho người dùng.*/

SELECT * FROM DanhGia
IF OBJECT_ID('sp_DanhGia_insert') IS NOT NULL
	DROP PROC sp_DanhGia_insert
	GO
 CREATE PROC sp_DanhGia_insert
	@MaNguoiDung VARCHAR(10),
	@MaNhaTro VARCHAR(10),
	@DanhGia BIT,
	@NoiDungDanhGia NVARCHAR(100)

AS 
	IF(@MaNguoiDung IS NULL OR @MaNguoiDung LIKE '')
		BEGIN 
			PRINT N'Chưa Nhập Mã Người Dùng'
			RETURN 
		END
	ELSE IF (@MaNhaTro IS NULL OR @MaNhaTro LIKE '')
		BEGIN 
			PRINT N'Chưa Nhập Mã Nhà Trọ'
		RETURN
        END
	ELSE IF(@DanhGia IS NULL OR @DanhGia LIKE '')
		BEGIN 
			PRINT N'Chưa Nhập Đánh Giá'
		RETURN
        END
	ELSE IF (@NoiDungDanhGia IS NULL OR @NoiDungDanhGia LIKE '')
		BEGIN 
			PRINT N'Chưa Nhập Nội Dung Đánh Giá'
		RETURN
        END
	ELSE 
		BEGIN 
			INSERT INTO DanhGia	VALUES(@MaNguoiDung,@MaNhaTro,@DanhGia,@NoiDungDanhGia)
			PRINT N'Thêm Dữ Liệu Thành Công'
		END
	GO
    
--Thực Thi Câu Lệnh
EXEC dbo.sp_DanhGia_insert @MaNguoiDung = 'N001',    -- varchar(10)
                           @MaNhaTro = 'NT001',       -- varchar(10)
                           @DanhGia = 1,      -- bit
                           @NoiDungDanhGia = N'Tốt' -- nvarchar(100)
SELECT *  FROM DanhGia

--2 Truy Vấn Thông Tin
IF OBJECT_ID('sp_NhaTro_select') IS NOT NULL
	DROP PROC sp_NhaTro_select 
	GO
  CREATE PROC sp_NhaTro_select 
		@Quan NVARCHAR(50) = N'%',
		@LoaiNhaTro NVARCHAR(50) = N'%',
		@DienTichMin FLOAT = NULL,
		@DienTichMax FLOAT = NULL ,
		@NgayDangMin DATE = NULL,
		@NgayDangMax DATE = NULL,
		@GiaPhongMin MONEY = NULL,
		@GiaPhongMax MONEY = NULL
AS 
	IF(@DienTichMin IS NULL )
		BEGIN 
			SELECT @DienTichMin = MIN(DienTich) FROM NhaTro
		END
	ELSE IF(@DienTichMax IS NULL )
		BEGIN 
			SELECT @DienTichMax = MAX(DienTich) FROM NhaTro
		END
	ELSE IF(@NgayDangMin IS NULL )
		BEGIN 
			SELECT @NgayDangMin = Min(NgayDangTin) FROM NhaTro
		END
		--SELECT * FROM NhaTro
	ELSE IF(@NgayDangMax IS NULL )
		BEGIN 
			SELECT @NgayDangMax = MAX(NgayDangTin) FROM NhaTro
		END
	ELSE IF(@GiaPhongMin IS NULL)
		BEGIN 
			SELECT @GiaPhongMin = MIN(GiaPhong) FROM NhaTro
		END
	ELSE IF(@GiaPhongMax IS NULL)
		BEGIN 
			SELECT @GiaPhongMax = MAX(GiaPhong) FROM NhaTro
		END
SELECT 
	(N'Cho Thuê Nhà Trọ Tại '+NhaTro.DiaChi+' ,'+NhaTro.Quan) AS DiaChi,
	(FORMAT(DienTich,'N','vi-VN')+' m2') AS DienTich,
	(FORMAT(GiaPhong,'N','vi-Vn')+N' VNĐ') AS GiaPhong,
	NhaTro.MoTa AS ThongTinNhaTro,
	CONVERT(VARCHAR,NgayDangTin,105) AS NgayDangTin,
	CASE NguoiDung.GioiTinh
	WHEN N'Nam' THEN 'A. '+NguoiDung.TenNguoiDung
	WHEN N'Nữ' THEN 'C. '+NguoiDung.TenNguoiDung
	END AS NguoiDang,
	DienThoai AS DienThoaiLienLac,
	NguoiDung.DiaChi + ' , '+NguoiDung.Quan AS DiaChiLienHe
	FROM NhaTro JOIN LoaiNha ON NhaTro.MaLoaiNha = LoaiNha.MaLoaiNha
	JOIN NguoiDung ON NhaTro.MaNguoiDung = NguoiDung.MaNguoiDung
	WHERE (DienTich <= @DienTichMax)
	AND (DienTich >= @DienTichMin)
	AND (NgayDangTin <= @NgayDangMax)
	AND (NgayDangTin >= @NgayDangMin)
	AND (GiaPhong <= @GiaPhongMax)
	AND (GiaPhong >= @GiaPhongMin)
	AND (NhaTro.Quan LIKE @Quan)
	AND (LoaiNha.TenLoaiNha LIKE @LoaiNhaTro)
ORDER BY NgayDangTin

--Truy vấn thông tin
EXEC dbo.sp_NhaTro_select @LoaiNhaTro = N'%Chung cư%'

SELECT * FROM LoaiNha JOIN NhaTro ON NhaTro.MaLoaiNha = LoaiNha.MaLoaiNha
JOIN NguoiDung ON NhaTro.MaNguoiDung = NguoiDung.MaNguoiDung
SELECT * FROM dbo.NhaTro