
struts2������������
	struts2���õ�jar
		commons-logging-1.1.1.jar
		freemarker-2.3.16.jar
		ognl-3.0.1.jar
		struts2-core-2.2.3.jar
		xwork-core-2.2.3.jar
		javassist-3.11.0.GA.jar
		commons-lang-2.5.jar

		commons-fileupload-1.2.2.jar
		commons-io-2.0.1.jar

	web.xml
		<?xml version="1.0" encoding="UTF-8"?>
		<web-app version="2.4" 
			xmlns="http://java.sun.com/xml/ns/j2ee" 
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
			xsi:schemaLocation="http://java.sun.com/xml/ns/j2ee 
			http://java.sun.com/xml/ns/j2ee/web-app_2_4.xsd">
			<filter>
				<filter-name>struts2</filter-name> 
				<!-- StrutsPrepareAndExecuteFilter����2.1.3��ʼ�������FilterDispatcher -->
				<filter-class>org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter</filter-class> 
			</filter>
			
			<filter-mapping>
				<filter-name>struts2</filter-name> 
				<!-- ����ʱ�� / * �м�Ŀո�ȥ�� -->
				<url-pattern>/ *</url-pattern> 
			</filter-mapping>  
		</web-app>

	//struts.xml�ļ������WEB-INF/classesĿ¼��
	struts.xml
		<!DOCTYPE struts PUBLIC
        "-//Apache Software Foundation//DTD Struts Configuration 2.0//EN"
        "http://struts.apache.org/dtds/struts-2.0.dtd">
		<struts>
			<package name="bwie" extends="struts-default">
				<!-- �����ַ http://localhost:8080/struts2/login.action -->
				<action name="login" class="com.test.UserAction">
					<result name="sucess">suc.jsp</result>
					<result name="error">fail.jsp</result>
				</action>
			</package>
		</struts>

	Action
		package com.test;
		public class UserAction {	
			private String username = "";//��ȡҳ���û���
			private String password = "";//��ȡҳ������		
			public String execute()
			{
				System.out.println(username + "__" + password);
				if (username.equals("admin") && password.equals("admin"))
				{
					return "sucess";
				}
				else
				{
					return "error";
				}
			}			
			public String getPassword() {
				return password;
			}			
			public void setPassword(String password) {
				this.password = password;
			}
			public String getUsername() {
				return username;
			}
			public void setUsername(String username) {
				this.username = username;
			}
		}

OGNL
	
	OGNL�������еĸ��������ֱ�ӷ��ʣ�����Ҫʹ���κ�����ġ���ǡ����������������е�������������Ҫʹ�á�#������ǡ�
		����ֵջ���������еĸ�������˿���ֱ�ӷ��ʡ�
		Struts2������ǰ�Actionʵ������ջ������ΪAction��ֵջ�У���ֵջ����OGNL�еĸ���
		��������Action�����Կ���ʡ�ԡ�#����ǣ���Ҳ��Ϊʲô�����ڽ��ҳ���п���ֱ�ӷ���Action�����Ե�ԭ��

	��#����Ҫ��������;��

		1. ����OGNL�����ĺ�Action�����ģ�#�൱��ActionContext.getContext()���±��м���ActionContext�����õ����ԣ�  
			����			����																���� 
			parameters		������ǰHTTP���������Map											#parameters.id[0]�����൱��request.getParameter("id") 
			request			������ǰHttpServletRequest�����ԣ�attribute)��Map					#request.userName�൱��request.getAttribute("userName") 
			session			������ǰHttpSession�����ԣ�attribute����Map							#session.userName�൱��session.getAttribute("userName") 
			application		������ǰӦ�õ�ServletContext�����ԣ�attribute����Map				#application.userName�൱��application.getAttribute("userName") 
			attr			���ڰ�request > session > application˳����������ԣ�attribute��	#attr.userName�൱�ڰ�˳��������������Χ��scope���ڶ�ȡuserName���ԣ�ֱ���ҵ�Ϊֹ 

		2. ���ڹ��˺�ͶӰ��projecting)���ϣ���books.{?#this.price<100}�� 
			
			1.���ϵ�ͶӰ�����ˣ����������ַ�ʽ��
				a.��?#����ͶӰ�����ˣ����з��������ļ��ϣ��磺users.{?#this.age > 19}��
				b.��^#����ͶӰ�����ˣ���һ������������Ԫ�أ��磺users.{^#this.age > 19}��
				c.��$#����ͶӰ�����ˣ����һ������������Ԫ�أ��磺users.{$#this.age > 19} ��
			2.��this����ʾ�����е�Ԫ�أ�
			3.ͶӰ�����ˣ��������ص���һ�����ϣ�����ʹ������ȡ�ü�����ָ����Ԫ�أ��磺users.{?#this.age > 19}[0]��

		3. ����Map����#{'foo1':'bar1', 'foo2':'bar2'}��

	��%�� ���ַ���������ֵ����OGNL���ʽ������Ҳ����˵�ַ�����#�����������ַ������������á���

		<s:set name="foobar" value="#{'foo1':'bar1', 'foo2':'bar2'}" />	 
		<p><s:url value="#foobar['foo1']" /></p>
		<p><s:url value="%{#foobar['foo1']}" /></p>

		�����
		#foobar['foo1']
		bar1
	
	��$����������Ҫ����;
		�����ڹ��ʻ���Դ�ļ��У�����OGNL���ʽ��������ο�����Struts 2.0�й��ʻ�(i18n)����Ӧ�ó��� 
		��Struts 2�����ļ��У�����OGNL���ʽ���� 
		<action name="AddPhoto" class="addPhoto">
            <interceptor-ref name="fileUploadStack" />            
            <result type="redirect">ListPhotos.action?albumId=${albumId}</result>
        </action>

ע��
	struts.xml�����srcĿ¼
	Action�������*.action����

struts2+spring+hibernate����

	struts.xml
		<!-- ��struts2����spring������ -->
		<constant name="struts.objectFactory" value="spring"></constant>

if elseif else ִ�л�����������ת��
	test:������־�������Ƿ���ʾ�ı��ʽ

	<%request.setAttribute("name", request.getParameter("name")); %>		
	<s:if test="#request.name == 'Max'">
		Max's file here
	</s:if>
	<s:elseif test="#request.name == 'Scott'">
		Scott's file here
	</s:elseif>
	<s:else>
		Other's file here
	</s:else>

struts2 �޸� struts.xml�Ĵ洢λ��
	<filter>
		<filter-name>struts2</filter-name> 
		<filter-class>org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter</filter-class>
		
		<init-param> 
			<!-- ���� ����struts.xml�ļ� -->  
			<param-name>config</param-name>   
			<param-value>
				struts-default.xml,
				../config/struts.xml
			</param-value>
		</init-param> 
	</filter>

package
	����
	<package name="bwie"  extends="struts-default" namespace="/t">
		<action name="test" class="com.bwie.Test2">
			<result>/s.jsp</result>
		</action>
	</package>
	����
	<s:form action="test" namespace="/t"></s:form>

Action�ӿ� ����˵��
	com.opensymphony.xwork2.Action ����˵��
	SUCCESS = "success"; ��ʾ����ִ�гɹ���Ӧ�ðѽ����ͼ��ʾ���û�
	NONE = "none";  ����ִ�гɹ����������κν����ͼ��ʾ���û�
	ERROR = "error"; ����ִ�в��ɹ�����Ӧ�ð�һ��������ͼ��ʾ���û�
	INPUT = "input"; ��ʾ������֤ʧ�ܲ�������Ľ���������ʾ���û�
	LOGIN = "login"; ��ʾ����û��ִ�У���Ϊ�û�û�е�¼����Ӧ�ѵ�¼��ͼ��ʾ���û�

�ϴ��ļ�
	lib
		commons-fileupload-1.2.jar
		commons-io-1.3.2.jar
	jspҳ��
		<s:form action="HelloWorld2" enctype="multipart/form-data" method="post">
			<s:file name="upFile"></s:file>
			<s:submit></s:submit>
		</s:form>
	action
		private File upFile = null;
		private String contentType = null;
		private String fileName = null;
		/**
		 * ���������Զ�����
		 */
		public void setUpFileContentType(String contentType)  {
			this.contentType = contentType;
		} 
		
		/**
		 * ���������Զ�����
		 */
		public void setUpFileFileName(String fileName)  {
			this.fileName = fileName;
		}

		public File getUpFile() {
			return upFile;
		}

		public void setUpFile(File upFile) {
			this.upFile = upFile;
		}

		public String upFile()
		{

			System.out.println(this.contentType);//�ļ�����
			String dataDir = ServletActionContext.getServletContext().getRealPath("/");
			String imageFileName = new Date().getTime() + getExtention(fileName);
			File saveFile = new File(dataDir + "/upFile/" + imageFileName);		
			upFile.renameTo(saveFile);
			return "upFileDefault";
		}
		
		private String getExtention(String fileName)  {
			int pos = fileName.lastIndexOf( "." );
			return fileName.substring(pos);
		}

ִ��Action��ĳһ������
	http://localhost:8181/struts2/login!test.action  ִ��login action���test����

���ʻ�
	properties�ļ� ������srcĿ¼
		struts.properties  �������ʻ��ļ�
			struts.custom.i18n.resources=globalMessages
		globalMessages_zh.properties	���ʻ�����
			HelloWorld=��ӭ������
		globalMessages_en.properties	���ʻ�����
			HelloWorld=Hello World value!!!!!
	jsp����
		<s:text name="HelloWorld"/><br>
    	<s:property value="%{getText('HelloWorld')}"/>
	

ҳ���ȡget/post����
	<s:property value="#parameters.p"/>

theme
	struts2��theme���԰���xhtml,html,simple,ajax ��Ĭ����xhtml

	theme������struts2��ǩ�����⣬Ĭ��Ϊxhtml��
	theme=xhtmlʱ����Ĭ�϶�������tr,td��
	theme=simpleʱ�������ɱ�ǩ����Ӧ��html��ǩ��ʽ��

	struts2��form��theme���޸� 
		�ڵ�htmlҳ����ʹ��struts2��ui tag��ʱ��һ�㶼Ҫ��theme����Ϊsimple����ÿ��tag�����ñȽ��鷳����ʱ�����ǿ���ʹ���������ַ����޸�Ĭ��ֵxhtml��
		��1����struts.xml�ļ����޸�Ĭ��ֵ��<constant name="struts.ui.theme" value="simple"/>��
		��2����struts.properties�ļ��У�����������䣺struts.ui.theme=simple

������
	Javassist library is missing in classpath! Please add missed dependency!
	����Ŀ����룺javassist-3.11.0.GA.jar

get��������
	javascript:
	var str = encodeURI(encodeURI('�й�'));

	action:
	str = URLDecoder.decode(URLDecoder.decode(str, "utf-8"),"utf-8");



	

	

struts2��ǩhtmlת�� ����escape="false"
	<s:property value="username" escape="false"/>

��ǩ�����෽��(����ʹ)

	����һ��

	<s:set name="str" value="'Hello World'"></s:set>

	<s:property value="%{@com.common.Constant@func(#str)}"/>

	func����com.common.Constant�����һ����̬����

	str�Ƕ�̬�Ĳ���

	��������

	<s:bean name="com.common.StrutsHelper" id="helper" />

	<s:set name="str" value="'Hello World'"></s:set>

	<s:property value="#helper.func(#str)" />

	func����com.common.StrutsHelper�����һ����ͨ����

	str�Ƕ�̬����

	s:bean��ʵ�Ƕ���StrutsHelper��ʵ������������һ��Щ���𣬷���һ��ĺ��������Ǿ�̬��






