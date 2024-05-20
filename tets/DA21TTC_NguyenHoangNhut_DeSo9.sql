create database DA21TTC_NguyenHoangNhut_DeSo9
go 

use DA21TTC_NguyenHoangNhut_DeSo9
go

select *from HOCVIEN
select *from GIAOVIEN
select *from MONHOC
select *from PHANCONG
select *from KETQUA

create table DANGKY(
	MaHV char(10),
	MaMon varchar(5),
	NgayKG datetime,
	NgayKT datetime,
	GhiChu nvarchar(30),
	primary key (MaHV, MaMon),
	foreign key (MaHV) references HOCVIEN(MaHV),
	foreign key (MaMon) references MONHOC(MaMon),
)
insert DANGKY (MaHV, MaMon, NgayKG, NgayKT, GhiChu) values ('1T19800001','ACCE1','12/05/2024','12/07/2024', N'A'),
 ('1T19800003','EXCEL','05/20/2024','05/30/2024', N'B'),
 ('1T19800005','PHOT1','06/06/2024','06/09/2024', N'C'),
 ('1T19800007','EXCEL','06/20/2024','06/30/2024', N'D'),
('1T19800009','PHOT1','06/20/2024','06/30/2024', N'E')
select * from DANGKY

-- VIEW --

-- trigger --

CREATE TRIGGER insert_monhoc
ON MONHOC
FOR INSERT
AS
IF (SELECT SoTiet FROM MONHOC) >= 30
BEGIN 
	PRINT N'them thanh cong'
	ROLLBACK TRANSACTION
	PRINT N'so tiet phai it nhat la 30'
END;
-- test --
insert into MONHOC (Mamon, TenMon, SoTiet) values ('SQL', N'CSDL', '21')
 
-- tao login cho 2 nguoi dung --
exec sp_addlogin 'QUANLYGIAOVIEN', '123' , 'DA21TTC_NguyenHoangNhut_DeSo9'
exec sp_addlogin 'NGUOIHOC', '123' , 'DA21TTC_NguyenHoangNhut_DeSo9'

CREATE USER QUANLYGIAOVIEN FOR LOGIN QUANLYGIAOVIEN
CREATE USER NGUOIHOC FOR LOGIN NGUOIHOC

-- PHAN QUYEN CHO QUANLYGIAOVIEN
GRANT SELECT ON GIAOVIEN TO QUANLYGIAOVIEN


-- PHAN QUYEN CHO NGUOIHOC
GRANT SELECT ON MONHOC TO NGUOIHOC

backup database DA21TTC_NguyenHoangNhut_DeSo9 to disk = 'D:\110121269\DA21TTC_NguyenHoangNhut_DeSo9.bak'