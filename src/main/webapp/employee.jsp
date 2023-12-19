<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee page</title>
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
        /* 新增的报销信息样式 */
        .reimburse-content {
            display: flex;
            flex-wrap: wrap;
        }

        .reimburse-item {
            width: 200px;
            margin: 10px;
            padding: 15px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
        }

        .reimburse-item h3 {
            margin-bottom: 10px;
            font-size: 18px;
            color: #333333;
        }

        .reimburse-item p {
            font-size: 14px;
            color: #666666;
        }

        /* 报销信息悬停效果 */
        .reimburse-item:hover {
            background: #f0f0f0;
        }


    </style>
</head>
<body>

<div class="container">
    <div class="employee-header">
        <h1 class="center h1">欢迎来到用户管理界面</h1>
        <button onclick="logout()">退出登录</button>
    </div>

    <div class="box">
        <div class="menu">
            <%--菜单栏：分别包含工资管理、报销管理、请假管理、通知和提醒、意见反馈、系统设置--%>
            <a onclick="showFunction('salary')">工资信息查看</a>
            <a onclick="showFunction('reimburse')">报销信息申报</a>
            <a onclick="showFunction('leave')">请假信息申报</a>
            <a onclick="showFunction('notice')">通知与提醒</a>
            <a onclick="showFunction('option')">意见反馈</a>
            <a onclick="showFunction('system')">系统设置</a>
        </div>

        <div class="content">
            <div id="salaryContent" class="function-content">
                <!-- 查询输入框和按钮 -->
                <input type="text" id="searchInput" placeholder="请输入查询内容">
                <button id="searchButton">查询</button>
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
            </div>

            <div id="reimburseContent" class="function-content">
                <!-- 新增报销记录按钮 -->
                <button id="addReimbursementButton" onclick="openReimbursementModal()">新增报销记录</button>

                <!-- 报销记录显示区域 -->
                <div id="reimbursementsList"></div>

                <!-- 报销记录的模态框 -->
                <!-- 模态框 -->
                <div id="addReimbursementModal" class="modal" style="display: none;">
                    <div class="modal-content">
                        <span class="close" onclick="closeReimbursementModal()">&times;</span>
                        <h2>新增报销记录</h2>
                        <form id="reimbursementForm">

                            <label for="reimbursementDate">日期:</label>
                            <input type="date" id="reimbursementDate" required>
                            <label for="reimbursementAmount">金额:</label>
                            <input type="number" id="reimbursementAmount" required>
                            <label for="reimbursementDescription">描述:</label>
                            <input type="text" id="reimbursementDescription" required>
                            <label for="reimbursementStatus">状态:</label>
                            <select id="reimbursementStatus" required>
                                <option value="待审批">待审批</option>
                                <option value="已批准">已批准</option>
                                <!-- 其他状态选项... -->
                            </select>

                            <button type="button" onclick="addReimbursement()">新增</button>
                        </form>
                    </div>
                </div>

            </div>


            <div id="leaveContent" class="function-content"></div>

            <div id="noticeContent" class="function-content"></div>

            <div id="optionContent" class="function-content"></div>

            <div id="systemContent" class="function-content"></div>
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
            id: 1,
            name: 'John Doe',
            position: 'Developer',
            basicSalary: 5000,
            hireDate: '2022-02-01',
            issueDate: '2022-03-01',
            baseSalary: 4000,
            allowance: 500,
            deduction: 200,
            actualSalary: 4300
        },
        {
            id: 1,
            name: 'John Doe',
            position: 'Developer',
            basicSalary: 5000,
            hireDate: '2022-03-01',
            issueDate: '2022-04-01',
            baseSalary: 4000,
            allowance: 500,
            deduction: 200,
            actualSalary: 4300
        },
        // 其他员工信息...
    ];

    // 获取表格的 tbody 元素
    const salaryTableBody = document.getElementById('salaryTableBody');

    // 遍历员工数据，生成表格行
    employees.forEach(employee => {
        addEmployeeRow(employee);
    });

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
        operateCell.innerHTML = '<button onclick="lookEmployeeRow(this)">具体信息</button>';
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

    // 报销记录数据，模拟初始数据
    let reimbursements = [
        {id: 1, date: '2023-01-01', amount: 500, description: '办公用品报销', status: '待审批'},
        {id: 2, date: '2023-02-15', amount: 800, description: '差旅报销', status: '已批准'},
        // 其他初始数据...
    ];

    // 获取报销记录显示区域的元素
    const reimbursementsList = document.getElementById('reimbursementsList');

    // 初始化报销记录
    function initReimbursements() {
        // 清空报销记录显示区域
        reimbursementsList.innerHTML = '';

        // 遍历报销记录数据，生成显示区域的内容
        reimbursements.forEach(reimbursement => {
            addReimbursementRow(reimbursement);
        });
    }

    // 打开报销记录的模态框
    function openReimbursementModal() {
        document.getElementById('addReimbursementModal').style.display = 'block';
    }

    // 关闭报销记录的模态框
    function closeReimbursementModal() {
        document.getElementById('addReimbursementModal').style.display = 'none';
    }

    // 新增报销记录
    function addReimbursement() {
        const reimbursementForm = document.getElementById('reimbursementForm');
        const date = reimbursementForm.elements['reimbursementDate'].value;
        const amount = reimbursementForm.elements['reimbursementAmount'].value;
        const description = reimbursementForm.elements['reimbursementDescription'].value;

        if (date && amount && description) {
            // 创建报销记录对象
            const reimbursement = {
                id: reimbursements.length + 1, // 模拟生成唯一 ID，实际应从后台获取
                date: date,
                amount: amount,
                description: description
            };

            // 添加报销记录到数组
            reimbursements.push(reimbursement);

            // 添加报销记录到显示区域
            addReimbursementRow(reimbursement);

            // 清空表单
            reimbursementForm.reset();

            // 关闭模态框
            closeReimbursementModal();
        } else {
            alert('请填写完整的报销记录信息！');
        }
    }

    function addReimbursementRow(reimbursement) {
        const newRow = document.createElement('div');
        newRow.classList.add('reimbursement-row');

        newRow.innerHTML = `
        <div>ID: ${reimbursement.id}</div>
        <div>日期: ${reimbursement.date}</div>
        <div>金额: ${reimbursement.amount}</div>
        <div>描述: ${reimbursement.description}</div>
        <div>状态: ${reimbursement.status}</div>
    `;

        // 将新行添加到显示区域
        reimbursementsList.appendChild(newRow);
    }


    // 初始化报销记录
    initReimbursements();


</script>

</body>
</html>
