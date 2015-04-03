﻿
<!DOCTYPE html>
<html>
  <head>
    <meta content="IE=Edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta charset="utf-8">
    <meta name="description" content="Open source rich text editor based on HTML5 and the progressive-enhancement approach. Uses a sophisticated security concept and aims to generate fully valid HTML5 markup by preventing unmaintainable tag soups and inline styles.">
    <meta property="og:image" content="http://voog.github.com/wysihtml5/img/og_image.png">
    <title>wysihtml5 - A better approach to rich text editing</title>
    
    <script src="bower_components/wysihtml5x/dist/wysihtml5x-toolbar.min.js" ></script>
    <script src="bower_components/wysihtml5x/parser_rules/advanced_and_extended.js" ></script>
    <!--[if lt IE 9]>
      <script src='http://html5shiv.googlecode.com/svn/trunk/html5.js'></script>
    <![endif]-->
    
    <link rel="stylesheet" href="http://yui.yahooapis.com/2.9.0/build/reset/reset-min.css">
    <link rel="stylesheet" href="css/stylesheet.css">
  </head>
  <body>
    <a href="https://github.com/Voog/wysihtml"><img style="position: absolute; top: 0; right: 0; border: 0;" src="https://s3.amazonaws.com/github/ribbons/forkme_right_darkblue_121621.png" alt="Fork me on GitHub"></a>

    <p class="get-started"><strong>Get started:</strong> <a href="https://github.com/Voog/wysihtml/archive/0.4.17.zip" target="_blank">Download</a> the latest version and read the <a href="https://github.com/Voog/wysihtml/wiki/Getting-Started" target="_blank">introduction</a></p>
    <div id="wysihtml5-editor-toolbar">
      <header>
        <ul class="commands">
          <li data-wysihtml5-command="bold" title="Make text bold (CTRL + B)" class="command"></li>
          <li data-wysihtml5-command="italic" title="Make text italic (CTRL + I)" class="command"></li>
          <li data-wysihtml5-command="insertUnorderedList" title="Insert an unordered list" class="command"></li>
          <li data-wysihtml5-command="insertOrderedList" title="Insert an ordered list" class="command"></li>
          <li data-wysihtml5-command="createLink" title="Insert a link" class="command"></li>
          <li data-wysihtml5-command="insertImage" title="Insert an image" class="command"></li>
          <li data-wysihtml5-command="formatBlock" data-wysihtml5-command-value="h1" title="Insert headline 1" class="command"></li>
          <li data-wysihtml5-command="formatBlock" data-wysihtml5-command-value="h2" title="Insert headline 2" class="command"></li>
          <li data-wysihtml5-command-group="foreColor" class="fore-color" title="Color the selected text" class="command">
            <ul>
              <li data-wysihtml5-command="foreColor" data-wysihtml5-command-value="silver"></li>
              <li data-wysihtml5-command="foreColor" data-wysihtml5-command-value="gray"></li>
              <li data-wysihtml5-command="foreColor" data-wysihtml5-command-value="maroon"></li>
              <li data-wysihtml5-command="foreColor" data-wysihtml5-command-value="red"></li>
              <li data-wysihtml5-command="foreColor" data-wysihtml5-command-value="purple"></li>
              <li data-wysihtml5-command="foreColor" data-wysihtml5-command-value="green"></li>
              <li data-wysihtml5-command="foreColor" data-wysihtml5-command-value="olive"></li>
              <li data-wysihtml5-command="foreColor" data-wysihtml5-command-value="navy"></li>
              <li data-wysihtml5-command="foreColor" data-wysihtml5-command-value="blue"></li>
            </ul>
          </li>
          <li data-wysihtml5-command="insertSpeech" title="Insert speech" class="command"></li>
          <li data-wysihtml5-action="change_view" title="Show HTML" class="action"></li>
        </ul>
      </header>
      <div data-wysihtml5-dialog="createLink" style="display: none;">
        <label>
          Link:
          <input data-wysihtml5-dialog-field="href" value="http://">
        </label>
        <a data-wysihtml5-dialog-action="save">OK</a>&nbsp;<a data-wysihtml5-dialog-action="cancel">Cancel</a>
      </div>

      <div data-wysihtml5-dialog="insertImage" style="display: none;">
        <label>
          Image:
          <input data-wysihtml5-dialog-field="src" value="http://">
        </label>
        <a data-wysihtml5-dialog-action="save">OK</a>&nbsp;<a data-wysihtml5-dialog-action="cancel">Cancel</a>
      </div>
    </div>
    
    <section>
      <textarea id="wysihtml5-editor" spellcheck="false" wrap="off" autofocus placeholder="Enter something ...">
<h1>WYSIHTML5x - A better approach to rich text editing</h1>
<p>wysihtml5x is an extended approach on xing/wysihtml5 <span class="wysiwyg-color-green"><a href="https://github.com/Voog/wysihtml">open source</a></span> rich text editor based on HTML5 technology and the progressive-enhancement approach.</p>
<h2>Features</h2>
<ul>
  <li>It's fast and lightweight (smaller than TinyMCE, Aloha, ...)</li>
  <li>Auto-linking of urls as-you-type</li>
  <li>Generates valid and semantic HTML5 markup (even when the content is pasted from MS Word)</li>
  <li>Uses class names instead of inline styles</li>
  <li>Unifies line break handling across browsers</li>
  <li>Uses sandboxed iframes in order to prevent identity theft through XSS</li>
  <li>Speech-input for Chrome</li>
  <li>No jQuery required</li>
</ul>

<h2>Extended features not present in xing/wysihtml5 0.4.0pre</h2>
<ul>
  <li>Can be used without iframe sandbox when initiated on div instead of textarea</li>
  <li>Blocking of image drag drop in editable is removed</li>
  <li>Table insertion management and cell merging commands</li>
  <li>Improved parser with options to: unwrap tag instead of remove, keep defined styles, complex object type definitions for allowing elements.</li>
  <li>Ability to add uneditable area inside editor text flow (useful when building modules like video tools, advanced image editor etc.)</li>
  <li>Improved formatblock handling</li>
  <li>Ability for user to remove formating with only collapsed caret. (without having to select exactly whole text)</li>
  <li>Improved speed</li>
</ul>

<h2>Browser Support</h2>
<ul>
  <li><img src="http://voog.github.com/wysihtml/img/icn_firefox.png" width="24" height="24"> Firefox 3.5+</li>
  <li><img src="http://voog.github.com/wysihtml/img/icn_chrome.png" width="24" height="24"> Chrome</li>
  <li><img src="http://voog.github.com/wysihtml/img/icn_internet_explorer.png" width="24" height="24"> IE 8+</li>
  <li><img src="http://voog.github.com/wysihtml/img/icn_safari.png" width="24" height="24"> Safari 4+</li>
  <li><img src="http://voog.github.com/wysihtml/img/icn_ios.png" width="24" height="24"> Safari on iOS 5+</li>
  <li><img src="http://voog.github.com/wysihtml/img/icn_opera.png" width="24" height="24"> Opera 11+</li>
  <li><strong>Graceful degradation:</strong> Unsupported browsers will get a <i>&amp;lt;textarea&amp;gt;</i></li>
</ul>
      </textarea>
    </section>
    <script>
        var editor = new wysihtml5.Editor("wysihtml5-editor", {
            toolbar: "wysihtml5-editor-toolbar",
            stylesheets: ["http://yui.yahooapis.com/2.9.0/build/reset/reset-min.css", "css/editor.css"],
            parserRules: wysihtml5ParserRules
        });

        editor.on("load", function () {
            var composer = editor.composer,
            h1 = editor.composer.element.querySelector("h1");
            if (h1) {
                composer.selection.selectNode(h1);
            }
        });
    </script>
  </body>
</html>