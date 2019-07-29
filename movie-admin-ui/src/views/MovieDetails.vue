<template>
    <div>
        <a-form
                layout="inline"
                :form="form"
                @submit="handleSubmit"
                class="mb-15"
        >
            <a-form-item label="电影名称">
                <a-input v-decorator="['name',{}]">
                    <a-icon
                            slot="prefix"
                            type="video-camera"
                            style="color:rgba(0,0,0,.25)"
                    />
                </a-input>
            </a-form-item>
            <a-form-item>
                <a-button
                        type="primary"
                        html-type="submit"
                        class="mr-15"
                >
                    查询
                </a-button>
            </a-form-item>
        </a-form>
        <a-card title="电影详细">
            <a-row>
                <a-col :span="6">
                    <img :src="data.cover" class="movie-cover">
                </a-col>
                <a-col :span="18">
                    <custom-progress :width="data.score.one" title="1星" bg-color="#e55d87"></custom-progress>
                    <custom-progress :width="data.score.two" title="2星" bg-color="#cf6e97"></custom-progress>
                    <custom-progress :width="data.score.three" title="3星" bg-color="#a68cb2"></custom-progress>
                    <custom-progress :width="data.score.four" title="4星" bg-color="#7baed1"></custom-progress>
                    <custom-progress :width="data.score.five" title="5星" bg-color="#5fc2e3"></custom-progress>
                    <a-divider/>
                    <a-row class="item">
                        <a-col :span="2" class="item-title">导演：</a-col>
                        <a-col :span="22">
                            <span v-for="i in data.directors">
                                <a href="">{{i.name}}</a>
                                <a-divider type="vertical"/>
                            </span>
                        </a-col>
                    </a-row>
                    <a-row class="item">
                        <a-col :span="2" class="item-title">编剧：</a-col>
                        <a-col :span="22">
                            <span v-for="i in data.writers">
                                <a href="">{{i.name}}</a>
                                <a-divider type="vertical"/>
                            </span>
                        </a-col>
                    </a-row>
                    <a-row class="item">
                        <a-col :span="2" class="item-title">主演：</a-col>
                        <a-col :span="22">
                            <div class="item-actor-wrap" v-for="i in data.actors">
                                <img :src="i.photo"/>
                                <p><a href="">{{i.name}}</a></p>
                                <p><a href="">{{i.enName}}</a></p>
                                <p><span>饰&nbsp;{{i.character}}</span></p>
                            </div>
                        </a-col>
                    </a-row>
                    <a-row class="item">
                        <a-col :span="2" class="item-title">类型：</a-col>
                        <a-col :span="22">
                            <span v-for="i in data.types">
                                <a href="">{{i.name}}</a>
                                <a-divider type="vertical"/>
                            </span>
                        </a-col>
                    </a-row>
                    <a-row class="item">
                        <a-col :span="2" class="item-title">片长：</a-col>
                        <a-col :span="22">
                            <span>{{data.runningTime}}</span>
                        </a-col>
                    </a-row>
                    <a-row class="item">
                        <a-col :span="2" class="item-title">国家地区：</a-col>
                        <a-col :span="22">
                            <a href="">{{data.regin.name}}</a>
                        </a-col>
                    </a-row>
                    <a-row class="item">
                        <a-col :span="2" class="item-title">发行日期：</a-col>
                        <a-col :span="22">
                            <span>{{data.releaseTime}}</span>
                        </a-col>
                    </a-row>
                    <a-row class="item" style="overflow: hidden">
                        <a-col :span="2" class="item-title">剧情：</a-col>
                        <a-col :span="22">
                            <span v-html="data.plot"></span>
                        </a-col>
                    </a-row>
                </a-col>
            </a-row>
        </a-card>
    </div>
</template>

<script>
    import CustomProgress from "../components/CustomProgress";
    import ACol from "ant-design-vue/es/grid/Col";

    export default {
        components: {
            ACol,
            CustomProgress},
        name: "movie-details",
        data: () => ({
            common: {
                //
            },
            data: {
                cover: 'http://img5.mtime.cn/mg/2019/01/09/171109.73085148_270X405X4.jpg',
                score: {
                    avg: 4.8,   // 平均分
                    participant: 4858,     // 评分人数
                    one: '0.8%',     // 1星
                    two: '4.5%',   // 2星
                    three: '31.4%',   // 3星
                    four: '43.3%',   // 4星
                    five: '20%'     // 5星
                },
                directors:[{id: 1, name:'罗伯特·罗德里格兹'}],
                writers: [{id: 2, name:'詹姆斯·卡梅隆'},{id: 3, name:'莱塔·卡罗格里迪斯'},{id: 4, name:'木城幸人'},],
                actors: [
                    {
                        id: 5,
                        name:'罗莎·萨拉查',
                        enName:'Rosa Salazar',
                        character:'Alita/阿丽塔',
                        photo:'http://img5.mtime.cn/mg/2017/12/09/112026.79393256_50X50X4.jpg'
                    },{
                        id: 6,
                        name:'克里斯托弗·沃尔兹',
                        enName:'Christoph Waltz',
                        character:'依德/Dr. Dyson Ido',
                        photo:'http://img31.mtime.cn/mg/2016/06/01/165152.41965270_50X50X4.jpg'
                    },{
                        id: 7,
                        name:'基恩·约翰逊',
                        enName:'Keean Johnson',
                        character:'雨果/Hugo',
                        photo:'http://img5.mtime.cn/mg/2018/03/11/172005.51438816_50X50X4.jpg'
                    },{
                        id: 8,
                        name:'艾德·斯克林',
                        enName:'Ed Skrein',
                        character:'扎潘/Zapan',
                        photo:'http://img31.mtime.cn/ph/2015/11/25/095109.71134683_58X58.jpg'
                    },{
                        id: 9,
                        name:'马赫沙拉·阿里',
                        enName:'Mahershala Ali',
                        character:'维克特/Vector',
                        photo:'http://img5.mtime.cn/ph/2017/02/27/095111.16595872_50X50.jpg'
                    }
                ],
                types: [{id: 10, name: '动作'},{id: 11, name: '科幻'},{id: 12, name: '冒险'}],
                regin: {
                    id: 13,
                    name: '美国'
                },
                releaseTime: '2019-02-22',
                runningTime: '122分钟',
                plot: '《阿丽塔：战斗天使》由科幻电影大师詹姆斯·卡梅隆编剧及监制，鬼才导演罗伯特·罗德里格兹执导，根据日本作家木城雪户经典漫画《铳梦》改编。<br/>' +
                '　　未来26世纪，科技发展，人类与机械改造人共存，弱肉强食是钢铁城唯一的生存法则。依德是钢铁城著名的改造人医生，他在垃圾场发现了一个半机械少女残躯，依德医生将其拯救后为她取名阿丽塔。阿丽塔虽然重获生命却失去了记忆，如一个新生儿一样对这个世界充满新鲜感。在依德医生与好友雨果的帮助下，她逐步适应着新生活和街头险恶。一次偶然的机会，阿丽塔发现自己竟有着惊人的战斗天赋。<br/>' +
                '　　一次次猎杀激发着她的觉醒，阿丽塔逐渐明白自己注定为战斗而生，为正义而战。一场揭开自己身世之谜，并打破宇宙旧秩序的史诗级冒险之旅就这样展开。<br/>' +
                '<br/>' +
                '故事发生在一个未来世界，当阿丽塔（罗莎·萨拉扎尔饰演）苏醒时，她已经丧失了所有对于过去的记忆。拯救她的人是依德（克里斯托弗·瓦尔兹饰演），一位好心的改造人医生，他意识到一位年轻女性的灵魂和一段非同寻常的过往依然存在于这具废弃改造人核心的某个地方。阿丽塔逐渐开始在钢铁城险恶的街道中探索她的全新人生，依德也试图保护她，让她免受神秘过往的侵害，而雨果（基恩·约翰逊饰演）这个拥有街头智慧的新朋友也伸出援手，帮助她找回自己的记忆。阿丽塔一直徒劳无功，直到管理着这座城市、以维克特（马赫沙拉·阿里饰演）为首的邪恶势力找上阿丽塔和依德，她才发现了一条有关过去的线索——她熟练掌握着独一无二的战斗技能，那些幕后的掌权者绝对不会对此袖手旁观。如果能逃脱追捕，她就会成为拯救自己的好友、亲人、乃至这个世界的关键。<br/>' +
                '<br/>' +
                '由詹姆斯·卡梅隆（《阿凡达》）制片兼编剧，罗伯特·罗德里格斯（《罪恶之城》）执导，改编自经典日本漫画《铳梦》。阿丽塔（罗莎·萨拉扎尔饰演，代表作《移动迷宫3：死亡解药》）醒来发现既不记得自己是谁，也不认识这个未来世界。<br/>' +
                '<br/>' +
                '善良的医生依德（克里斯托夫·沃尔兹饰演，代表作《被解救的姜戈》）收留了阿丽塔，因为他意识到在这被遗弃的机器人外壳下，潜藏着一个有着非凡的心灵。当阿丽塔逐步适应她的新生活和钢铁城的街头险恶时，依德想试图让她远离她那神秘的过往，但她的街头朋友雨果（基恩·约翰逊饰演）则试图帮她唤起回忆。<br/>' +
                '<br/>' +
                '城市腐败统治者对阿丽塔展开了追捕，她却因此发现了有关过去的线索——她具有独特而强大的战斗能力。若她能够逃离他们的控制，她就能成为拯救她的朋友，家人和她所爱世界的关键。<br/>' +
                '<br/>' +
                '本片根据同名漫画改编而成，故事设定在26世纪，那时科技已经可以重塑人类的大部分器官，不少人都换上了机械的身体。主人公艾德某天在垃圾堆里找到一个少女的机械残躯。艾德把她救活并将其命名为阿丽塔，但她已失去了以前的记忆。在一次偶然的机会下，艾德发现阿丽塔原来有着超强的战斗力，注定了她的使命就是要不停的战斗……'
            }
        }),
        computed: {
            // 处理表单使其具有自动收集数据并校验的功能
            form: function () {
                return this.$form.createForm(this)
            }
        },
        watch: {
        },
        mounted: function() {

        },
        methods: {
            // Only show error after a field is touched.
            handleSubmit  (e) {
                e.preventDefault()
                this.form.validateFields((err, values) => {
                    if (!err) {
                        console.log('Received values of form: ', values);
                    }
                });

            },
        }
    }
</script>

<style scoped>
    .movie-cover{
        max-width: 270px;
        margin-right: 30px;
    }
    .item{
        margin-bottom: 10px;
    }
    .item-title{
        color: #444;
    }
    .item-actor-wrap{
        float: left;
    }
    .item-actor-wrap > img{
        float: left;
    }
    .item-actor-wrap > p{
        padding: 0 10px 0 60px;
        margin: 0;
        line-height: 16px;
    }
    .item-actor-wrap > p > a, .item-actor-wrap > p > span{
        font-size: 12px;
    }
</style>