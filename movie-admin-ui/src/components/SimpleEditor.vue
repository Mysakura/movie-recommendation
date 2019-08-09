<template>
    <div>
        <div class="quill-editor-example">
            <!-- quill-editor -->
            <quill-editor ref="myTextEditor"
                          v-model="content"
                          :options="editorOption"
                          @blur="onEditorBlur($event)"
                          @focus="onEditorFocus($event)"
                          @ready="onEditorReady($event)">
            </quill-editor>
            <div>
                <p style="margin-top: 15px;">表单提交内容：</p>
                <pre><code class="hljs" v-html="contentCode"></code></pre>
                <p>高亮示例：</p>
                <pre><code class="hljs" v-html="javaCode"></code></pre>
            </div>
        </div>
    </div>
</template>

<script>
    import hljs from 'highlight.js'
    import 'highlight.js/styles/atom-one-dark.css';

    export default {
        name: "simple-editor",
        data() {
            return {
                // 编辑器内容
                content: ``,
                editorOption: {
                    modules: {
                        toolbar: [
                            ['bold', 'italic', 'underline', 'strike'],
                            ['blockquote', 'code-block',{ 'align': [] },'link', 'image'],
                            [{ 'header': 1 }, { 'header': 2 }],
                            [{ 'list': 'ordered' }, { 'list': 'bullet' }],
                            [{ 'script': 'sub' }, { 'script': 'super' }],
                            [{ 'indent': '-1' }, { 'indent': '+1' }],
                            [{ 'direction': 'rtl' }],
                            [{ 'color': [] }, { 'background': [] }],
                            [{ 'size': ['small', false, 'large', 'huge'] },{ 'header': [1, 2, 3, 4, 5, 6, false] },{ 'font': [] }],
                            // ['clean']
                        ],
                        syntax: {
                            highlight: text => hljs.highlightAuto(text).value
                        }
                    }
                }
            }
        },
        methods: {
            onEditorBlur(editor) {
                console.log('editor blur!', editor)
            },
            onEditorFocus(editor) {
                console.log('editor focus!', editor)
            },
            onEditorReady(editor) {
                console.log('editor ready!', editor)
            }
        },
        computed: {
            editor() {
                return this.$refs.myTextEditor.quill
            },
            contentCode() {
                return hljs.highlightAuto(this.content).value
            },
            javaCode(){
                return hljs.highlightAuto('@PostMapping("/hello")\n' +
                    'public BaseResponse<BasePageResponse<DemoDTO>> hello(@RequestBody DemoRequest request){\n' +
                    '    return demoFacade.getList(request);\n' +
                    '}').value
            }
        },
        mounted() {
            console.log('this is my editor', this.editor)
            this.content = `<p><br></p><p><br></p><p>JavaScript代码：</p><pre class="ql-syntax" spellcheck="false"><span class="hljs-keyword">const</span> a = <span class="hljs-number">10</span>;
<span class="hljs-keyword">const</span> editorOption = { highlight: <span class="hljs-built_in">text</span> =&gt; hljs.highlightAuto(<span class="hljs-built_in">text</span>).value };
</pre><p><br></p><p>Java代码：</p><pre class="ql-syntax" spellcheck="false">@PostMapping("/hello")
public BaseResponse&lt;BasePageResponse&lt;DemoDTO&gt;&gt; hello(@RequestBody DemoRequest request){
    return demoFacade.getList(request);
}
</pre><p><br></p>`
        },
        updated(){
        }
    }
</script>

<style scoped>

</style>