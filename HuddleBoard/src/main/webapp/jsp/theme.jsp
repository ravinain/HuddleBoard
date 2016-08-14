<!-- <div class="themeDiv">
	<div class="themeBtn">&nbsp;</div>
	<div id="colors">
		<span id="theme1">&nbsp;</span>
		<span id="theme2">&nbsp;</span>
		<span id="theme3">&nbsp;</span>
		<span id="theme4">&nbsp;</span>
	</div>
</div> -->
<%@ page isELIgnored ="false" %>

<div class="themeDiv">
	<div class="themeBtn">
		<img src="${pageContext.request.contextPath}/images/open_1.png" onclick="showThemes(this)" />
	</div>
	<div class="themeContent">
		<img src="${pageContext.request.contextPath}/images/close_1.png" class="closeThemeBtn" onclick="hideThemes(this)" />
		<div class="themeArea">
			<table>
				<colgroup>
					<col width="20px">
					<col width="20px">
					<col width="20px">
					<col width="20px">
					<col width="20px">
				</colgroup>
				<tr>
					<td class="redTheme">&nbsp;</td>
					<td class="greenTheme">&nbsp;</td>
					<td class="blueTheme">&nbsp;</td>
					<td class="redTheme">&nbsp;</td>
					<td class="greenTheme">&nbsp;</td>
				</tr>
				<tr>
					<td class="redTheme">&nbsp;</td>
					<td class="greenTheme">&nbsp;</td>
					<td class="blueTheme">&nbsp;</td>
					<td class="redTheme">&nbsp;</td>
					<td class="greenTheme">&nbsp;</td>
				</tr>
				<tr>
					<td class="redTheme">&nbsp;</td>
					<td class="greenTheme">&nbsp;</td>
					<td class="blueTheme">&nbsp;</td>
					<td class="redTheme">&nbsp;</td>
					<td class="greenTheme">&nbsp;</td>
				</tr>
				<tr>
					<td class="redTheme">&nbsp;</td>
					<td class="greenTheme">&nbsp;</td>
					<td class="blueTheme">&nbsp;</td>
					<td class="redTheme">&nbsp;</td>
					<td class="blueTheme">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="5" align="center" class="saveThemeLink">
						<br />
						<a href="#">Save Theme</a>
					</td>
				</tr>
				<tr>
					<td colspan="5" align="center" class="saveThemeLink">
						<br />
						<a href="#">Set Background Image</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>