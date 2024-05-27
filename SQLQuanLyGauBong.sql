create database congnghephanmem
use  congnghephanmem

CREATE TABLE LoaiHang (
    MaLoaiHang CHAR(10) PRIMARY KEY,
    TenLoaiHang VARCHAR(50) NOT NULL
)
ALTER TABLE LoaiHang
ALTER COLUMN TenLoaiHang NVARCHAR(50)

CREATE TABLE SanPham (
    MaSanPham CHAR(10) PRIMARY KEY,
    TenSanPham NVARCHAR(50) NOT NULL,
    SoLuong INT CHECK(SoLuong > 0),
    MaLoaiHang CHAR(10) NOT NULL,
    GiaNhap FLOAT CHECK(GiaNhap > 0),
    GiaBan FLOAT CHECK(GiaBan > 0), 
    GhiChu NVARCHAR(255),
	HinhAnh IMAGE
    FOREIGN KEY (MaLoaiHang) REFERENCES LoaiHang(MaLoaiHang)
);
ALTER TABLE SanPham
DROP CONSTRAINT CK__SanPham__SoLuong__398D8EEE; -- Xóa ràng bu?c CHECK hi?n t?i

ALTER TABLE SanPham
ADD CONSTRAINT CK_SanPham_SoLuong CHECK (SoLuong >= 0); -- Thêm ràng bu?c CHECK m?i
ALTER TABLE SanPham
ADD HinhAnh IMAGE
ALTER TABLE SanPham DROP COLUMN HinhAnh;
CREATE TABLE NhanVien (
    MaNhanVien CHAR(10) PRIMARY KEY,
    TenNhanVien NVARCHAR(50) NOT NULL,
    GioiTinh NVARCHAR(3) NOT NULL,
    NamSinh DATETIME NOT NULL,
    DiaChi NVARCHAR(255) NOT NULL,
    SoDienThoai CHAR(10) NOT NULL
);

CREATE TABLE KhachHang (
    MaKhachHang CHAR(10) PRIMARY KEY,
    TenKhachHang VARCHAR(50) NOT NULL,
    GioiTinh NVARCHAR(3) NOT NULL,
    NamSinh DATETIME NOT NULL,
    DiaChi NVARCHAR(255) NOT NULL,
    SoDienThoai CHAR(10) NOT NULL
)
 

CREATE TABLE NhaCungCap (
    MaNhaCungCap CHAR(10) PRIMARY KEY,
    TenNhaCungCap NVARCHAR(50) NOT NULL,
    DiaChi NVARCHAR(50) NOT NULL,
    SoDienThoai CHAR(10) NOT NULL
);

select * from NhaCungCap
ALTER TABLE KhachHang
ALTER COLUMN TenKhachHang NVARCHAR(50)

CREATE TABLE HoaDonBan (
    MaHoaDonBan CHAR(10) PRIMARY KEY,
    MaNhanVien CHAR(10) NOT NULL,
    MaKhachHang CHAR(10) NOT NULL,
    NgayBan DATETIME NOT NULL,
    TongTien FLOAT CHECK(TongTien > 0),
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien),
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang)
);

CREATE TABLE ChiTietHoaDonBan (
    MaHoaDonBan CHAR(10),
    MaSanPham CHAR(10),
    SoLuong INT CHECK(SoLuong > 0),
    GiaBan FLOAT CHECK(GiaBan > 0),
	ThanhTien FLOAT,
    PRIMARY KEY (MaHoaDonBan, MaSanPham),
    FOREIGN KEY (MaHoaDonBan) REFERENCES HoaDonBan(MaHoaDonBan),
    FOREIGN KEY (MaSanPham) REFERENCES SanPham(MaSanPham)
)

ALTER TABLE ChiTietHoaDonBan DROP CONSTRAINT FK_ChiTietHoaDonBan_HoaDonBan;
ALTER TABLE ChiTietHoaDonNhap DROP CONSTRAINT [FK__ChiTietHo__MaSan__5BE2A6F2]
select *  from nhanvien;
select *  from HoaDonnhap;

select *  from ChiTietHoaDonnhap;
delete  from ChiTietHoaDonBan
delete from hoadonnhap
CREATE TABLE HoaDonNhap (
    MaHoaDonNhap CHAR(10) PRIMARY KEY,
    MaNhanVien CHAR(10) NOT NULL,
    MaNhaCungCap CHAR(10) NOT NULL,
    NgayNhap DATETIME NOT NULL,
    TongTien FLOAT CHECK(TongTien > 0),
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien),
    FOREIGN KEY (MaNhaCungCap) REFERENCES NhaCungCap(MaNhaCungCap)
);

CREATE TABLE ChiTietHoaDonNhap (
    MaHoaDonNhap CHAR(10),
    MaSanPham CHAR(10),
    SoLuong INT CHECK(SoLuong > 0),
    GiaNhap FLOAT CHECK(GiaNhap > 0),
    PRIMARY KEY (MaHoaDonNhap, MaSanPham),
    FOREIGN KEY (MaHoaDonNhap) REFERENCES HoaDonNhap(MaHoaDonNhap),
    FOREIGN KEY (MaSanPham) REFERENCES SanPham(MaSanPham)
);

CREATE TABLE Accounts (
    IdAccount CHAR(10) PRIMARY KEY,
    Username VARCHAR(50) NOT NULL,
    Passwords VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Phanquyen VARCHAR(50) 
)

select * from Accounts
