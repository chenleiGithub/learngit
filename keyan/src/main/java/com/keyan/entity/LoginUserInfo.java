package com.keyan.entity;

public class LoginUserInfo {
	// 用户ID
	private Integer userId;
	// 登录名
	private String userName;
	// 昵称
	private String nickName;
	// 真实姓名
	private String name;
	// 性别
	private long genderCode;
	// 证件类型
	private long idType;
	// 身份证号
	private String idNo;
	// 出生日期
	private String birthday;
	// 手机
	private String mobile;
	// 邮箱
	private String email;
	// 个人头像图片文件夹名称
	private String photoUrl;
	// 组织id
	private Integer organizationId;
	// 组织类型
	private String organizationType;
	// 单位名称
	private String bureauName;
	// 组织机构代码
	private String locationCode;
	// 用户类型
	private Integer userType;
	// 是否管理员
	private Integer isAdmin;
	// 部门id
	private Integer departmentId;
	// 部门名称
	private String departmentName;
	// 教师班级关系id
	private Integer teacherClassId;
	// 教师类型
	private Integer teacherType;
	// 学生班级关系id
	private Integer studentClassId;
	// 班级名称
	private String className;
	// 学校名称
	private String schoolName;
	// 加密盐
	private String salt;

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public long getGenderCode() {
		return genderCode;
	}

	public void setGenderCode(long genderCode) {
		this.genderCode = genderCode;
	}

	public long getIdType() {
		return idType;
	}

	public void setIdType(long idType) {
		this.idType = idType;
	}

	public String getIdNo() {
		return idNo;
	}

	public void setIdNo(String idNo) {
		this.idNo = idNo;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhotoUrl() {
		return photoUrl;
	}

	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}

	public Integer getOrganizationId() {
		return organizationId;
	}

	public void setOrganizationId(Integer organizationId) {
		this.organizationId = organizationId;
	}

	public String getOrganizationType() {
		return organizationType;
	}

	public void setOrganizationType(String organizationType) {
		this.organizationType = organizationType;
	}

	public String getBureauName() {
		return bureauName;
	}

	public void setBureauName(String bureauName) {
		this.bureauName = bureauName;
	}

	public String getLocationCode() {
		return locationCode;
	}

	public void setLocationCode(String locationCode) {
		this.locationCode = locationCode;
	}

	public Integer getUserType() {
		return userType;
	}

	public void setUserType(Integer userType) {
		this.userType = userType;
	}

	public Integer getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(Integer isAdmin) {
		this.isAdmin = isAdmin;
	}

	public Integer getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public Integer getTeacherClassId() {
		return teacherClassId;
	}

	public void setTeacherClassId(Integer teacherClassId) {
		this.teacherClassId = teacherClassId;
	}

	public Integer getTeacherType() {
		return teacherType;
	}

	public void setTeacherType(Integer teacherType) {
		this.teacherType = teacherType;
	}

	public Integer getStudentClassId() {
		return studentClassId;
	}

	public void setStudentClassId(Integer studentClassId) {
		this.studentClassId = studentClassId;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

}
