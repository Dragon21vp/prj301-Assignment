CREATE TABLE users (
    id INT IDENTITY(1,1) PRIMARY KEY,
    username NVARCHAR(50) UNIQUE NOT NULL,
    password NVARCHAR(255) NOT NULL,
    full_name NVARCHAR(100) NOT NULL,
    department NVARCHAR(50) NOT NULL,
    role NVARCHAR(50) NOT NULL
);
INSERT INTO users (username, password, full_name, department, role) VALUES
(N'MrA', N'1234', N'Nguyễn Văn A', N'IT', N'Administrator'),
(N'MrB', N'2345', N'Nguyễn Văn B', N'IT', N'Manager'),
(N'MrC', N'3456', N'Nguyễn Văn C', N'HR', N'Manager'),
(N'D', N'4567', N'Trần Thị D', N'IT', N'Employee'),
(N'E', N'5678', N'Lê Thị E', N'Finance', N'Employee'),
(N'F', N'6789', N'Hoàng Văn F', N'Marketing', N'Employee');

SELECT * FROM users;

