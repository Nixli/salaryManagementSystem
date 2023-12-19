<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin page</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background-color: #d9d9d9;
            font-family: Georgia, "Times New Roman", Times, serif;
        }

        .container {
            width: 100%;
            height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .employee-header {
            flex: 1;
            color: black;
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: center;
            padding: 20px;
            box-shadow: 7px 7px 7px rgba(0, 0, 0, 0.15)
        }

        .h1 {
            flex: 1;
        }

        .employee-header button {
            background-color: #d9d9d9;
            color: black;
            padding: 10px;
            border: none;
            cursor: pointer;
            width: auto;
            height: auto;
        }

        .employee-header button:hover {
            background: rgba(146, 146, 146, 0.2);
        }

        .box {
            flex: 9;
            display: flex;
        }


        .menu {
            width: 150px;
            height: 77vh;
            display: flex;
            align-items: center;
            justify-content: space-around;
            flex-direction: column;
            padding: 20px;
            box-shadow: 7px 7px 7px rgba(0, 0, 0, 0.15)
        }

        .menu a {
            color: black;
            text-decoration: none;
            padding: 10px 0;
            cursor: pointer;
            font-size: 24px
        }

        .menu a:hover {
            background: rgba(146, 146, 146, 0.2);
        }

        .content {
            flex: 1;
            padding: 20px;
            box-shadow: 7px 7px 7px rgba(0, 0, 0, 0.15)
        }

        .function-content {
            display: none;
        }

        .center {
            text-align: center;
        }

        /* 新增的样式 */
        .modal {
            display: none; /* 默认隐藏模态框 */
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* 半透明背景 */
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
        }

        /* 新增的样式 */
        .close {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 18px;
            cursor: pointer;
        }

        /* 表格样式 */
        .table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 更轻的阴影 */
        }

        .table th,
        .table td {
            border: 1px solid #ecf0f1; /* 边框颜色 */
            padding: 10px;
            text-align: left;
        }

        .table th {
            background-color: #d9d9d9;
            color: black;
        }

        /* 表格行的悬停效果 */
        .table tbody tr:hover {
            background: rgba(146, 146, 146, 0.2);
        }

        /* 表格操作按钮 */
        .table button {
            background-color: #d9d9d9;
            color: black;
            padding: 5px 10px;
            border: none;
            cursor: pointer;
            border-radius: 3px;
        }

        .table button:hover {
            background: rgba(146, 146, 146, 0.2);
        }


    </style>
</head>
<body>

<div class="container">
    <div class="employee-header">
        <h1 class="center h1">欢迎来到管理员界面</h1>
        <button onclick="logout()">退出登录</button>
    </div>

    <div class="box">
        <div class="menu">
            <%--菜单栏：分别包含工资管理、报销管理、请假管理、通知和提醒、意见反馈、系统设置--%>

            <a onclick="showFunction('salary')">工资信息管理</a>
            <a onclick="showFunction('reimburse')">报销信息管理</a>
            <a onclick="showFunction('leave')">请假管理</a>
            <a onclick="showFunction('notice')">通知与提醒</a>
            <a onclick="showFunction('option')">工资异议反馈</a>
            <a onclick="showFunction('system')">员工信息管理</a>

        </div>

        <div class="content">

            <div id="salaryContent" class="function-content">
                <div>
                    <!-- 新增员工按钮 -->
                    <button id="addEmployeeButton">新增</button>
                    <!-- 取消按钮 -->
                    <button id="cancelButton" onclick="closeModal()">取消</button>

                    <!-- 查询输入框和按钮 -->
                    <input type="text" id="searchInput" placeholder="请输入查询内容">
                    <button id="searchButton">查询</button>

                </div>
                <table class="table">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Position</th>
                        <th>Basic Salary</th>
                        <th>Hire Date</th>
                        <th>Issue Date</th>
                        <th>Base Salary</th>
                        <th>Allowance</th>
                        <th>Deduction</th>
                        <th>Actual Salary</th>
                        <th>Operate</th>
                    </tr>
                    </thead>
                    <tbody id="salaryTableBody"></tbody>
                </table>
                <!-- 模态框 -->
                <div id="addEmployeeModal" class="modal" style="display: none;">
                    <div class="modal-content">
                        <span class="close" onclick="closeModal()">&times;</span>
                        <h2>新增员工信息</h2>
                        <form id="employeeForm">

                            <label for="name">姓名:</label>
                            <input type="text" id="name" required>
                            <label for="position">职位:</label>
                            <input type="text" id="position" required>
                            <label for="basicSalary">基本工资:</label>
                            <input type="number" id="basicSalary" required>
                            <label for="hireDate">入职日期:</label>
                            <input type="date" id="hireDate" required>
                            <label for="issueDate">发薪日期:</label>
                            <input type="date" id="issueDate" required>
                            <label for="baseSalary">基本工资:</label>
                            <input type="number" id="baseSalary" required>
                            <label for="allowance">津贴:</label>
                            <input type="number" id="allowance" required>
                            <label for="deduction">扣款:</label>
                            <input type="number" id="deduction" required>
                            <label for="actualSalary">实际工资:</label>
                            <input type="number" id="actualSalary" required>
                            <button type="button" onclick="addEmployee()">新增</button>
                        </form>
                    </div>
                </div>

            </div>

            <div id="reimburseContent" class="function-content">
                <table class="table">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Employee Name</th>
                        <th>Amount</th>
                        <th>Date</th>
                        <th>Status</th>
                        <th>Operate</th>
                    </tr>
                    </thead>
                    <tbody id="reimburseTableBody"></tbody>
                </table>
            </div>

            <div id="leaveContent" class="function-content">
                <table class="table">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Employee Name</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Reason</th>
                        <th>Status</th>
                        <th>Operate</th>
                    </tr>
                    </thead>
                    <tbody id="leaveTableBody"></tbody>
                </table>
            </div>

            <div id="noticeContent" class="function-content">
                <table class="table">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Content</th>
                        <th>Date</th>
                        <th>Status</th>
                        <th>Operate</th>
                    </tr>
                    </thead>
                    <tbody id="noticeTableBody"></tbody>
                </table>
            </div>

            <div id="optionContent" class="function-content">
                <table class="table">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Feedback</th>
                        <th>Date</th>
                        <th>Status</th>
                        <th>Operate</th>
                    </tr>
                    </thead>
                    <tbody id="optionTableBody"></tbody>
                </table>
            </div>

            <div id="systemContent" class="function-content">
                <table class="table">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Position</th>
                        <th>Department</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Address</th>
                    </tr>
                    </thead>
                    <tbody id="systemTableBody"></tbody>
                </table>
            </div>

        </div>
    </div>

</div>

<script>
    function showFunction(functionName) {
        // 隐藏所有功能内容
        var functionContents = document.getElementsByClassName('function-content');
        for (var i = 0; i < functionContents.length; i++) {
            functionContents[i].style.display = 'none';
        }

        // 显示对应功能的内容
        var contentId = functionName + 'Content';
        document.getElementById(contentId).style.display = 'block';
    }

    function logout() {
        // 在这里可以添加退出登录的逻辑，例如跳转到登录页面
        window.location.href = 'index.jsp';
    }

    // 使用 let 初始化表格数据
    let employees = [
        {
            id: 1,
            name: 'John Doe',
            position: 'Developer',
            basicSalary: 5000,
            hireDate: '2022-01-01',
            issueDate: '2022-02-01',
            baseSalary: 4000,
            allowance: 500,
            deduction: 200,
            actualSalary: 4300
        },
        {
            id: 2,
            name: 'Jane Doe',
            position: 'Designer',
            basicSalary: 5500,
            hireDate: '2022-03-15',
            issueDate: '2022-04-01',
            baseSalary: 4500,
            allowance: 600,
            deduction: 250,
            actualSalary: 4700
        },
        {
            id: 3,
            name: 'Bob Smith',
            position: 'Manager',
            basicSalary: 7000,
            hireDate: '2021-12-10',
            issueDate: '2022-01-01',
            baseSalary: 6000,
            allowance: 800,
            deduction: 300,
            actualSalary: 6500
        },
        {
            id: 4,
            name: 'Alice Johnson',
            position: 'Engineer',
            basicSalary: 6000,
            hireDate: '2022-02-20',
            issueDate: '2022-03-01',
            baseSalary: 5000,
            allowance: 700,
            deduction: 250,
            actualSalary: 5750
        },
        {
            id: 5,
            name: 'Chris Brown',
            position: 'Analyst',
            basicSalary: 6500,
            hireDate: '2022-05-05',
            issueDate: '2022-06-01',
            baseSalary: 5500,
            allowance: 600,
            deduction: 200,
            actualSalary: 5900
        },
        {
            id: 6,
            name: 'Eva Green',
            position: 'Manager',
            basicSalary: 7200,
            hireDate: '2022-04-10',
            issueDate: '2022-05-01',
            baseSalary: 6000,
            allowance: 800,
            deduction: 300,
            actualSalary: 6500
        },
        {
            id: 7,
            name: 'Mike Turner',
            position: 'Developer',
            basicSalary: 5200,
            hireDate: '2022-06-20',
            issueDate: '2022-07-01',
            baseSalary: 4500,
            allowance: 600,
            deduction: 250,
            actualSalary: 4700
        },
        {
            id: 8,
            name: 'Sophie Davis',
            position: 'Designer',
            basicSalary: 6000,
            hireDate: '2022-08-15',
            issueDate: '2022-09-01',
            baseSalary: 5000,
            allowance: 700,
            deduction: 250,
            actualSalary: 5750
        },
        {
            id: 9,
            name: 'Alex White',
            position: 'Analyst',
            basicSalary: 7000,
            hireDate: '2022-10-05',
            issueDate: '2022-11-01',
            baseSalary: 5500,
            allowance: 600,
            deduction: 200,
            actualSalary: 5900
        },
        {
            id: 10,
            name: 'Emma Smith',
            position: 'Engineer',
            basicSalary: 5800,
            hireDate: '2022-12-12',
            issueDate: '2023-01-01',
            baseSalary: 5000,
            allowance: 600,
            deduction: 200,
            actualSalary: 5400
        }
    ];

    // 获取表格的 tbody 元素
    const salaryTableBody = document.getElementById('salaryTableBody');

    // 遍历员工数据，生成表格行
    employees.forEach(employee => {
        addEmployeeRow(employee);
    });

    // 打开模态框
    function openModal() {
        document.getElementById('addEmployeeModal').style.display = 'block';
    }

    // 关闭模态框
    function closeModal() {
        document.getElementById('addEmployeeModal').style.display = 'none';
    }

    // 新增员工按钮点击事件
    var addEmployeeButton = document.getElementById('addEmployeeButton');
    addEmployeeButton.addEventListener('click', openModal);

    // 取消按钮点击事件
    var cancelButton = document.getElementById('cancelButton');
    cancelButton.addEventListener('click', closeModal);

    // 新增员工
    function addEmployee() {
        var employeeForm = document.getElementById('employeeForm');
        var name = employeeForm.elements['name'].value;
        var position = employeeForm.elements['position'].value;
        var basicSalary = employeeForm.elements['basicSalary'].value;
        var hireDate = employeeForm.elements['hireDate'].value;
        var issueDate = employeeForm.elements['issueDate'].value;
        var baseSalary = employeeForm.elements['baseSalary'].value;
        var allowance = employeeForm.elements['allowance'].value;
        var deduction = employeeForm.elements['deduction'].value;
        var actualSalary = employeeForm.elements['actualSalary'].value;

        if (id && name && position && basicSalary && hireDate && issueDate && baseSalary && allowance && deduction && actualSalary) {
            // 创建员工对象
            var employee = {
                name: name,
                position: position,
                basicSalary: basicSalary,
                hireDate: hireDate,
                issueDate: issueDate,
                baseSalary: baseSalary,
                allowance: allowance,
                deduction: deduction,
                actualSalary: actualSalary
            };

            // 添加员工信息
            addEmployeeRow(employee);

            // 清空表单
            employeeForm.reset();

            // 关闭模态框
            closeModal();
        } else {
            alert('请填写完整的员工信息！');
        }
    }

    // 在表格的 tbody 中添加员工信息行
    function addEmployeeRow(employee) {
        var tableBody = document.getElementById('salaryTableBody');
        var newRow = tableBody.insertRow(-1);

        for (var key in employee) {
            var cell = newRow.insertCell();
            cell.textContent = employee[key];
        }

        // 操作列
        var operateCell = newRow.insertCell();
        operateCell.innerHTML = '<button onclick="editEmployeeRow(this)">修改</button>' +
            '<button onclick="deleteEmployeeRow(this)">删除</button>';
    }

    // 编辑员工信息，可以在这里弹出模态框让用户修改
    function editEmployeeRow(button) {
        // 编辑逻辑，可以在这里弹出模态框让用户修改员工信息
        alert('点击了修改按钮');
    }

    // 删除员工信息
    function deleteEmployeeRow(button) {
        var row = button.parentNode.parentNode;
        row.parentNode.removeChild(row);
    }

    // 获取按钮和输入框元素
    const searchInput = document.getElementById('searchInput');
    const searchButton = document.getElementById('searchButton');

    // 添加 "查询" 按钮的点击事件
    searchButton.addEventListener('click', () => {
        // 获取输入框中的查询内容
        const searchText = searchInput.value.toLowerCase();

        // 使用 Array.filter 方法过滤员工数据
        const filteredEmployees = employees.filter(employee =>
            Object.values(employee).some(value => value.toString().toLowerCase().includes(searchText))
        );

        // 清空表格
        salaryTableBody.innerHTML = '';

        // 遍历筛选后的员工数据，生成表格行
        filteredEmployees.forEach(employee => {
            addEmployeeRow(employee);
        });
    });

    // 使用 let 初始化报销信息数据
    let reimbursements = [
        {id: 1, employeeName: 'John Doe', amount: 200, date: '2023-01-05', status: '代办'},
        {id: 2, employeeName: 'Jane Doe', amount: 300, date: '2023-01-10', status: '已批准'},
        {id: 3, employeeName: 'Bob Smith', amount: 150, date: '2023-01-15', status: '拒绝'},
        {id: 4, employeeName: 'Alice John', amount: 400, date: '2023-01-15', status: '代办'},
        {id: 5, employeeName: 'Eva Green', amount: 100, date: '2023-01-15', status: '已批准'},
        {id: 6, employeeName: 'Mike Turner', amount: 150, date: '2023-01-15', status: '拒绝'},

    ];

    // 获取报销信息表格的 tbody 元素
    const reimburseTableBody = document.getElementById('reimburseTableBody');

    // 遍历报销信息数据，生成表格行
    reimbursements.forEach(reimbursement => {
        addReimburseRow(reimbursement);
    });

    // 在表格的 tbody 中添加行的函数
    function addReimburseRow(reimbursement) {
        // 创建表格行
        const row = document.createElement('tr');

        // 添加单元格
        for (const key in reimbursement) {
            const cell = document.createElement('td');
            cell.textContent = reimbursement[key];
            row.appendChild(cell);
        }

        // 在表格的 tbody 中添加行
        // 添加 "Operate" 列的按钮
        const operateCell = document.createElement('td');
        const approveButton = document.createElement('button');
        approveButton.textContent = '批准';
        approveButton.addEventListener('click', () => {
            // 在这里添加处理批准按钮点击事件的逻辑
            // 可以更新报销信息的状态为批准
            alert('点击了批准按钮');
        });
        const rejectButton = document.createElement('button');
        rejectButton.textContent = '拒绝';
        rejectButton.addEventListener('click', () => {
            // 在这里添加处理拒绝按钮点击事件的逻辑
            // 可以更新报销信息的状态为拒绝
            alert('点击了拒绝按钮');
        });
        operateCell.appendChild(approveButton);
        operateCell.appendChild(rejectButton);

        row.appendChild(operateCell);

        reimburseTableBody.appendChild(row);
    }

    // 请假管理的数据
    const leaveData = [
        {
            id: 1,
            employeeName: 'John Doe',
            startDate: '2023-01-05',
            endDate: '2023-01-10',
            reason: 'Vacation',
            status: 'Approved'
        },
        {
            id: 2,
            employeeName: 'Jane Doe',
            startDate: '2023-02-15',
            endDate: '2023-02-20',
            reason: 'Personal',
            status: 'Pending'
        },
        {
            id: 3,
            employeeName: 'Bob Smith',
            startDate: '2023-03-10',
            endDate: '2023-03-15',
            reason: 'Sick Leave',
            status: 'Rejected'
        },
        {
            id: 4,
            employeeName: 'Alice Johnson',
            startDate: '2023-04-20',
            endDate: '2023-04-25',
            reason: 'Vacation',
            status: 'Approved'
        },
        {
            id: 5,
            employeeName: 'Chris Brown',
            startDate: '2023-05-05',
            endDate: '2023-05-10',
            reason: 'Personal',
            status: 'Pending'
        }
    ];

    // 获取请假表格的 tbody 元素
    const leaveTableBody = document.getElementById('leaveTableBody');

    // 遍历请假管理的数据，生成表格行
    leaveData.forEach(leave => {
        addLeaveRow(leave);
    });

    // 在表格的 tbody 中添加行的函数
    function addLeaveRow(leave) {
        // 创建表格行
        const row = document.createElement('tr');

        // 添加单元格
        for (const key in leave) {
            const cell = document.createElement('td');
            cell.textContent = leave[key];
            row.appendChild(cell);
        }

        // 在表格的 tbody 中添加行
        // 添加 "Operate" 列的按钮（示例中为查看详情按钮）
        const operateCell = document.createElement('td');
        const viewButton = document.createElement('button');
        viewButton.textContent = '查看详情';
        viewButton.addEventListener('click', () => {
            // 在这里添加处理查看详情按钮点击事件的逻辑
            alert('点击了查看详情按钮');
        });
        operateCell.appendChild(viewButton);

        row.appendChild(operateCell);

        leaveTableBody.appendChild(row);
    }

    // 使用 let 初始化通知数据
    let notices = [
        {
            id: 1,
            title: 'Important Meeting',
            content: 'There is an important meeting at 10 AM.',
            date: '2023-02-15',
            status: 'Unread'
        },
        {
            id: 2,
            title: 'Holiday Notice',
            content: 'The office will be closed on Monday for a public holiday.',
            date: '2023-02-18',
            status: 'Unread'
        },
        {
            id: 3,
            title: 'Project Deadline',
            content: 'The project deadline is approaching. Make sure to complete your tasks.',
            date: '2023-02-25',
            status: 'Unread'
        },
        {
            id: 4,
            title: 'Training Session',
            content: 'There will be a training session on new software tools next week.',
            date: '2023-03-05',
            status: 'Unread'
        },
        {
            id: 5,
            title: 'Server Maintenance',
            content: 'Server maintenance is scheduled for Saturday night. Expect temporary service interruptions.',
            date: '2023-03-10',
            status: 'Unread'
        }
    ];

    // 获取通知表格的 tbody 元素
    const noticeTableBody = document.getElementById('noticeTableBody');

    // 遍历通知数据，生成表格行
    notices.forEach(notice => {
        addNoticeRow(notice);
    });

    // 在表格的 tbody 中添加行的函数
    function addNoticeRow(notice) {
        // 创建表格行
        const row = document.createElement('tr');

        // 添加单元格
        for (const key in notice) {
            const cell = document.createElement('td');
            cell.textContent = notice[key];
            row.appendChild(cell);
        }

        // 在表格的 tbody 中添加行
        // 添加 "Operate" 列的按钮（这里以删除按钮为例）
        const operateCell = document.createElement('td');
        const deleteButton = document.createElement('button');
        deleteButton.textContent = 'Delete';
        deleteButton.addEventListener('click', () => {
            // 在这里添加处理删除按钮点击事件的逻辑
            // 以下示例中只是移除 DOM 元素，实际应用中可能需要从数据数组中删除相应的项
            noticeTableBody.removeChild(row);
        });
        operateCell.appendChild(deleteButton);

        row.appendChild(operateCell);

        noticeTableBody.appendChild(row);
    }

    // 使用 let 初始化争议反馈数据
    let disputeFeedbacks = [
        {
            id: 1,
            name: 'John Doe',
            feedback: 'I have a dispute about my actual salary calculation.',
            date: '2023-02-20',
            status: 'Open'
        },
        {
            id: 2,
            name: 'Jane Doe',
            feedback: 'There is an error in the deduction amount of my salary.',
            date: '2023-02-22',
            status: 'Open'
        },
        {
            id: 3,
            name: 'Bob Smith',
            feedback: 'My allowance is not correctly reflected in the recent salary statement.',
            date: '2023-02-25',
            status: 'Open'
        },
        // ... 可以添加更多的争议反馈数据
    ];

    // 获取争议反馈表格的 tbody 元素
    const optionTableBody = document.getElementById('optionTableBody');

    // 遍历争议反馈数据，生成表格行
    disputeFeedbacks.forEach(disputeFeedback => {
        addDisputeFeedbackRow(disputeFeedback);
    });

    // 在表格的 tbody 中添加行的函数
    function addDisputeFeedbackRow(disputeFeedback) {
        // 创建表格行
        const row = document.createElement('tr');

        // 添加单元格
        for (const key in disputeFeedback) {
            const cell = document.createElement('td');
            cell.textContent = disputeFeedback[key];
            row.appendChild(cell);
        }

        // 在表格的 tbody 中添加行
        // 添加 "Operate" 列的按钮（这里以处理按钮为例）
        const operateCell = document.createElement('td');
        const processButton = document.createElement('button');
        processButton.textContent = 'Process';
        processButton.addEventListener('click', () => {
            // 在这里添加处理处理按钮点击事件的逻辑
            // 例如，改变反馈状态、打开处理模态框、记录处理意见等
            alert('Clicked Process Button');
        });
        operateCell.appendChild(processButton);

        row.appendChild(operateCell);

        optionTableBody.appendChild(row);
    }

    // 使用 let 初始化员工信息数据
    let employeesInfo = [
        {
            id: 1,
            name: 'John Doe',
            position: 'Developer',
            department: 'IT',
            email: 'john@example.com',
            phone: '123-456-7890',
            address: '123 Main St'
        },
        {
            id: 2,
            name: 'Jane Doe',
            position: 'Designer',
            department: 'Design',
            email: 'jane@example.com',
            phone: '987-654-3210',
            address: '456 Oak St'
        },
        {
            id: 3,
            name: 'Bob Smith',
            position: 'Manager',
            department: 'Management',
            email: 'bob@example.com',
            phone: '555-123-4567',
            address: '789 Pine St'
        },
        // ... 可以添加更多的员工信息数据
    ];

    // 获取员工信息表格的 tbody 元素
    const systemTableBody = document.getElementById('systemTableBody');

    // 遍历员工信息数据，生成表格行
    employeesInfo.forEach(employeeInfo => {
        addEmployeeInfoRow(employeeInfo);
    });

    // 在表格的 tbody 中添加行的函数
    function addEmployeeInfoRow(employeeInfo) {
        // 创建表格行
        const row = document.createElement('tr');

        // 添加单元格
        for (const key in employeeInfo) {
            const cell = document.createElement('td');
            cell.textContent = employeeInfo[key];
            row.appendChild(cell);
        }

        // 在表格的 tbody 中添加行
        systemTableBody.appendChild(row);
    }


</script>

</body>
</html>
