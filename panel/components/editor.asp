<script type="text/javascript">
    var formSubmitting = false;
    var setFormSubmitting = function () { formSubmitting = true; }

    window.onbeforeunload = function () {
        if (formSubmitting) {
            return undefined;
        }
        if ($("#textarea").val() != "" || $("#title").val() != "") {
            return '注意，您将离开本页面（未保存的数据会消失）';
        }
    }
</script>
<div class="controls">
<label class="control-label" for="title" style="font-size:20px;">标题</label>
<input type="text" class="input-xlarge" name="title" id="title" value="" style="width:80%;"/>
</div>
<div id="toolbar">
<div class="block">
    <a data-wysihtml5-command="bold" title="CTRL+B" class="bold"></a>
    <a data-wysihtml5-command="italic" title="CTRL+I" class="italic"></a>
    <a data-wysihtml5-command="underline" title="CTRL+U" class="underline"></a>
    <a data-wysihtml5-command="superscript" title="sup" class="superscript"></a>
    <a data-wysihtml5-command="subscript" title="sub" class="subscript"></a>
</div>
<div class="block">
    <a data-wysihtml5-command="createLink" class="link"></a>
    <div class="dialog">
        <div data-wysihtml5-dialog="createLink" style="display:none;">
            <label>
                网址:
                <input data-wysihtml5-dialog-field="href" value="http://">
            </label>
            <a data-wysihtml5-dialog-action="save">确定</a>&nbsp;<a data-wysihtml5-dialog-action="cancel">取消</a>
        </div>
    </div>
</div>
<div class="block">
    <a data-wysihtml5-command="insertImage" class="image"></a>
    <div class="dialog">
        <div data-wysihtml5-dialog="insertImage" style="display: none;">
            <label>
                图片:
                <input data-wysihtml5-dialog-field="src" value="<%="http://"&Application("domain")&"/actions/download.asp?fid="%>"> 
            </label>
            <label>
                对齐:
                <select data-wysihtml5-dialog-field="className">
                    <option value="">默认</option>
                    <option value="wysiwyg-float-left">左对齐</option>
                    <option value="wysiwyg-float-right">右对齐</option>
                </select>
            </label>
            <a data-wysihtml5-dialog-action="save">确定</a>&nbsp;<a data-wysihtml5-dialog-action="cancel">取消</a>
        </div>
    </div>
</div>
<!--
<a data-wysihtml5-command="removeLink" class="unlink">
    <s>link</s>
</a> 
<a data-wysihtml5-command="formatBlock" data-wysihtml5-command-value="h1">h1</a> 
<a data-wysihtml5-command="formatBlock" data-wysihtml5-command-value="h2">h2</a> 
<a data-wysihtml5-command="formatBlock" data-wysihtml5-command-value="h3">h3</a> 
<a data-wysihtml5-command="formatBlock" data-wysihtml5-command-value="p">p</a> 
<a data-wysihtml5-command="formatBlock" data-wysihtml5-command-value="pre">pre</a> 
<a data-wysihtml5-command="formatBlock" data-wysihtml5-command-blank-value="true">plaintext</a>'
<a data-wysihtml5-command="insertBlockQuote">blockquote</a>
<a data-wysihtml5-command="formatCode" data-wysihtml5-command-value="language-html">Code</a>
    -->
<div class="block">
    <a data-wysihtml5-command="fontSizeStyle" class="fontsize"></a>
    <div class="dialog">
        <div data-wysihtml5-dialog="fontSizeStyle" style="display: none;">
            字体大小:
            <input type="text" data-wysihtml5-dialog-field="size" style="width: 60px;" value="" />
            <a data-wysihtml5-dialog-action="save">确定</a>&nbsp;<a data-wysihtml5-dialog-action="cancel">取消</a>
        </div>
    </div>
</div>
<div class="block">
    <a data-wysihtml5-command="insertUnorderedList" class="listbullet"></a> 
    <a data-wysihtml5-command="insertOrderedList" class="listnumber"></a>
</div>
<div class="block" style="display:none;">
    <a data-wysihtml5-command="outdentList">&lt;-</a> <a data-wysihtml5-command="indentList">
        -&gt;</a>
</div>
<div class="block" style="display:none;">
    <a data-wysihtml5-command="justifyLeft">justifyLeft</a> 
    <a data-wysihtml5-command="justifyRight">justifyRight</a> 
    <a data-wysihtml5-command="justifyFull">justifyFull</a>
</div>
<div class="block">
    <a data-wysihtml5-command="alignLeftStyle" class="alignleft"></a> 
    <a data-wysihtml5-command="alignRightStyle" class="alignright"></a> 
    <a data-wysihtml5-command="alignCenterStyle" class="aligncenter"></a>
</div>
<div class="block">
    <a data-wysihtml5-command="foreColorStyle" class="forecolor"></a>
    <div class="dialog">
        <div data-wysihtml5-dialog="foreColorStyle" style="display: none;">
            字体颜色:
            <input type="text" data-wysihtml5-dialog-field="color" value="rgba(0,0,0,1)" />
            <a data-wysihtml5-dialog-action="save">确认</a>&nbsp;<a data-wysihtml5-dialog-action="cancel">取消</a>
        </div>
    </div>
</div>
<div class="block" style="display:none;">
    <a data-wysihtml5-command="bgColorStyle" class="bgcolor"></a>
    <div class="dialog">
        <div data-wysihtml5-dialog="bgColorStyle" style="display: none;">
            背景颜色:
            <input type="text" data-wysihtml5-dialog-field="color" value="rgba(0,0,0,1)" />
            <a data-wysihtml5-dialog-action="save">确认</a>&nbsp;<a data-wysihtml5-dialog-action="cancel">取消</a>
        </div>
    </div>
</div>
<div class="block">
    <a data-wysihtml5-command="undo" class="undo"></a> 
    <a data-wysihtml5-command="redo" class="redo"></a>
</div>
<div class="block">
    <a data-wysihtml5-action="change_view" class="html"></a>
</div>
</div>
<!-- element to edit -->
<textarea id="textarea" name="content" placeholder="输入内容 ..."></textarea>