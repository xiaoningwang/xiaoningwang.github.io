---
layout: archive
title: "Xiaoning Wang - CV"
permalink: /cv/
author_profile: true
redirect_from:
  - /resume
---

{% include base_path %}

<div class="cv-container">
  <!-- Hero Section -->
  <section class="hero-section">
    <div class="hero-content">
      <h1>👋 欢迎加入我们的团队！</h1>
      <p class="hero-subtitle">探索AI与数据科学的无限可能</p>
    </div>
  </section>

  <!-- Recruitment Section -->
  <section class="cv-section recruitment">
    <div class="section-header">
      <h2 class="section-title">🚀 组会招新</h2>
    </div>
    <div class="section-content">
      <p>欢迎本科高年级和研究生同学参加我的组会讨论（校外同学可线上接入），我的组会讨论方向主要集中于：</p>
      <div class="tech-badges">
        <span class="tech-badge">大语言模型</span>
        <span class="tech-badge">智能体</span>
        <span class="tech-badge">多源数据整合</span>
        <span class="tech-badge">抽样技术</span>
        <span class="tech-badge">计算社会学</span>
        <span class="tech-badge">网络科学</span>
        <span class="tech-badge">统计机器学习</span>
        <span class="tech-badge">文本挖掘</span>
      </div>
      <p>欢迎感兴趣的同学联系我，我的邮箱：<strong>sdwangxiaoning@foxmail.com</strong></p>
      
      <div class="project-highlight">
        <h3>✨ 我们的智能助教项目</h3>
        <p>我们团队正在开发智能助教-书卷侠（Scholar Hero），感兴趣的老师同学欢迎体验并给予反馈意见：</p>
        <a href="https://scholarhero.cn/" class="btn btn-primary">访问 Scholar Hero</a>
      </div>
    </div>
  </section>

  <!-- Education Section -->
  <section class="cv-section education">
    <div class="section-header">
      <h2 class="section-title">🎓 教育经历</h2>
    </div>
    <div class="section-content">
      <div class="timeline">
        <div class="timeline-item">
          <div class="timeline-date">2013</div>
          <div class="timeline-content">
            <strong>理学学士</strong> - 数学与应用数学专业
            <span class="institution">天津理工大学</span>
          </div>
        </div>
        <div class="timeline-item">
          <div class="timeline-date">2017</div>
          <div class="timeline-content">
            <strong>经济学硕士</strong> - 统计学专业
            <span class="institution">中国人民大学</span>
            <span class="supervisor">导师：<a href="http://stat.ruc.edu.cn/jszy/lxl/index.html">吕晓玲</a></span>
          </div>
        </div>
        <div class="timeline-item">
          <div class="timeline-date">2019</div>
          <div class="timeline-content">
            <strong>经济学博士</strong> - 统计学专业
            <span class="institution">中国人民大学</span>
            <span class="supervisor">导师：<a href="http://cfas.ruc.edu.cn/kydw/rtyjy/jyj/index.htm">金勇进</a></span>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Work Experience Section -->
  <section class="cv-section work-experience">
    <div class="section-header">
      <h2 class="section-title">💼 工作经历</h2>
    </div>
    <div class="section-content">
      <div class="timeline">
        <div class="timeline-item">
          <div class="timeline-date">2017.9 - 2018.4</div>
          <div class="timeline-content">
            <strong>访问学者</strong>
            <span class="institution">威斯康辛大学-麦迪逊分校</span>
            <span class="research-area">研究方向：缺失数据和生存分析</span>
          </div>
        </div>
        <div class="timeline-item">
          <div class="timeline-date">2019.7 - 2021.7</div>
          <div class="timeline-content">
            <strong>师资博士后</strong>
            <span class="institution">中国传媒大学，数据科学与智能媒体学院</span>
            <span class="research-area">研究方向：融媒体技术和评价体系、融媒体数据分析</span>
          </div>
        </div>
        <div class="timeline-item">
          <div class="timeline-date">2021.7 - 2022.6</div>
          <div class="timeline-content">
            <strong>讲师</strong>
            <span class="institution">中国传媒大学，数据科学与智能媒体学院</span>
            <span class="research-area">研究方向：数据整合估计，计算传播学，计算社会学和社会媒体分析</span>
          </div>
        </div>
        <div class="timeline-item">
          <div class="timeline-date">2022.7 - 至今</div>
          <div class="timeline-content">
            <strong>副教授</strong>
            <span class="institution">中国传媒大学，数据科学与智能媒体学院</span>
            <span class="research-area">研究方向：大语言模型，多源数据整合估计，计算传播学，计算社会学和社会媒体分析</span>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Research Tools Section -->
  <section class="cv-section research-tools">
    <div class="section-header">
      <h2 class="section-title">🔧 常用研究工具</h2>
    </div>
    <div class="section-content">
      <div class="tool-grid">
        <div class="tool-item">
          <strong>R & Python</strong>
        </div>
        <div class="tool-item">
          <strong>Linux</strong>
        </div>
        <div class="tool-item">
          <strong>ChatGPT, Kimi</strong>
        </div>
        <div class="tool-item">
          <strong>Hadoop & Spark & Hbase</strong>
        </div>
      </div>
    </div>
  </section>

  <!-- Publications Section -->
  <section class="cv-section publications">
    <div class="section-header">
      <h2 class="section-title">📚 相关著作</h2>
    </div>
    <div class="section-content">
      <ul class="publication-list">
        {% for post in site.publications %}
          {% include archive-single-cv.html %}
        {% endfor %}
      </ul>
    </div>
  </section>

  <!-- Teaching Section -->
  <section class="cv-section teaching">
    <div class="section-header">
      <h2 class="section-title">🎒 开设课程</h2>
    </div>
    <div class="section-content">
      <ul class="teaching-list">
        {% for post in site.teaching %}
          {% include archive-single-cv.html %}
        {% endfor %}
      </ul>
    </div>
  </section>

  <!-- Positions Section -->
  <section class="cv-section positions">
    <div class="section-header">
      <h2 class="section-title">👔 兼任职务</h2>
    </div>
    <div class="section-content">
      <ul class="positions-list">
        <li>中国现场统计研究会统计学历史与文化分会副理事长</li>
        <li>中国商业统计学会人工智能分会秘书长</li>
        <li>统计之都秘书长</li>
        <li>国际调查统计学家协会会员(IASS)</li>
        <li>中国人民大学中国调查与数据中心研究员</li>
      </ul>
    </div>
  </section>

  <!-- Lecture Experience Section -->
  <section class="cv-section lectures">
    <div class="section-header">
      <h2 class="section-title">🎤 讲座经历</h2>
    </div>
    <div class="section-content">
      <p>曾受邀为国家统计局申请民意调查中心、人力资源和社会保障部、教育部、民政部老龄科学中心、微众银行、中国商业统计学会、中国人民大学、首都经济贸易大学、暨南大学、中国知网、华东师范大学等多家政府单位和高校讲授数据分析、智能体、AI赋能教学、AI赋能科研的讲座。</p>
    </div>
  </section>

  <!-- Awards Section -->
  <section class="cv-section awards">
    <div class="section-header">
      <h2 class="section-title">🏆 获奖情况</h2>
    </div>
    <div class="section-content">
      <ol class="awards-list">
        <li>"AI融合"校级优质本科课程，中国传媒大学，2025</li>
        <li>中国传媒大学第十届（2025年）本科教学成果奖二等奖，中国传媒大学，2025</li>
        <li>"个人突出贡献奖"和"优秀导师"， 中国商业统计学会，2025</li>
        <li>优秀共产党员，中国传媒大学，2024</li>
        <li>首届教师AI基本功大赛，中国传媒大学，2024，一等奖</li>
        <li>首届孺子牛奖，中国传媒大学，2024</li>
        <li>优秀班主任，中国传媒大学，2022</li>
        <li>首届孺子牛奖，中国传媒大学数据科学与智能媒体学院，2021</li>
        <li>指导本科生全国大学生市场调查大赛，本科2024年：国赛二等奖3组，国赛三等奖8组，北京市一等奖8组，二等奖3组，三等奖2组；本科2023年：国赛一等奖2组，国赛三等奖7组，北京市一等奖4组，二等奖1组；本科2022年：国赛一等奖1组，国赛二等奖1组，国赛三等奖5组，北京市二等奖1组；2021研究生市场调查大赛全国三等奖1组，连续3年获得最佳院校组织奖（2022-2024）</li>
        <li>曾获北京市优秀毕业生（2019）、中国人民大学学业一等奖学金（2018）、社会工作与志愿服务奖学金（2018）、三好学生（2018）、优秀研究生（2017）、优秀社会实践调查员（2017）、全国高校学生创新统计联盟优秀论文（2016）等。</li>
      </ol>
    </div>
  </section>

  <!-- Hobbies Section -->
  <section class="cv-section hobbies">
    <div class="section-header">
      <h2 class="section-title">🌟 兴趣爱好</h2>
    </div>
    <div class="section-content">
      <div class="hobby-grid">
        <div class="hobby-item">
          <div class="hobby-icon">🏃</div>
          <div class="hobby-info">
            <strong>跑步</strong>
            <p>累计跑8个全程马拉松，PB 4小时31分</p>
          </div>
        </div>
        <div class="hobby-item">
          <div class="hobby-icon">📖</div>
          <div class="hobby-info">
            <strong>读书</strong>
            <p>持续学习，不断探索新知识</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- WeChat Section -->
  <section class="cv-section wechat">
    <div class="section-header">
      <h2 class="section-title">📱 个人公众号</h2>
    </div>
    <div class="section-content">
      <div class="wechat-container">
        <div class="wechat-info">
          <h3>抽样调查之家</h3>
          <p>分享统计学知识、数据分析技巧和研究动态</p>
        </div>
        <div class="wechat-qrcode">
          <img src="{{ '/assets/images/qrcode.jpg' | prepend: site.baseurl }}" alt="欢迎扫码关注公众号" class="qrcode-img">
          <p class="qrcode-desc">欢迎扫码关注</p>
        </div>
      </div>
    </div>
  </section>
</div>

<style>
/* CV Page Styles */
.cv-container {
  max-width: 1000px;
  margin: 0 auto;
  padding: 20px;
}

/* Hero Section */
.hero-section {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  padding: 40px;
  border-radius: 12px;
  text-align: center;
  margin-bottom: 30px;
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
}

.hero-content h1 {
  margin: 0;
  font-size: 2.5rem;
  margin-bottom: 10px;
}

.hero-subtitle {
  font-size: 1.2rem;
  opacity: 0.9;
  margin: 0;
}

/* Section Styles */
.cv-section {
  background: white;
  border-radius: 12px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
  margin-bottom: 30px;
  overflow: hidden;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.cv-section:hover {
  transform: translateY(-5px);
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.12);
}

.section-header {
  background: #f8fafc;
  padding: 20px 30px;
  border-bottom: 1px solid #e2e8f0;
}

.section-title {
  margin: 0;
  color: #2563eb;
  font-size: 1.5rem;
  display: flex;
  align-items: center;
}

.section-title::before {
  content: '';
  display: inline-block;
  width: 4px;
  height: 30px;
  background: #2563eb;
  margin-right: 15px;
  border-radius: 2px;
}

.section-content {
  padding: 30px;
}

/* Tech Badges */
.tech-badges {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
  margin: 20px 0;
}

.tech-badge {
  background: #2563eb;
  color: white;
  padding: 8px 16px;
  border-radius: 20px;
  font-size: 0.9rem;
  font-weight: 500;
  transition: all 0.3s ease;
}

.tech-badge:hover {
  background: #4f46e5;
  transform: translateY(-2px);
  box-shadow: 0 4px 8px rgba(37, 99, 235, 0.3);
}

/* Project Highlight */
.project-highlight {
  background: #f0f9ff;
  border: 1px solid #bae6fd;
  border-radius: 8px;
  padding: 20px;
  margin-top: 20px;
}

.project-highlight h3 {
  margin-top: 0;
  color: #0369a1;
}

/* Buttons */
.btn {
  display: inline-block;
  padding: 10px 20px;
  border-radius: 6px;
  font-weight: 500;
  text-decoration: none;
  transition: all 0.3s ease;
  border: none;
  cursor: pointer;
}

.btn-primary {
  background: #2563eb;
  color: white;
}

.btn-primary:hover {
  background: #4f46e5;
  transform: translateY(-2px);
  box-shadow: 0 4px 8px rgba(37, 99, 235, 0.3);
}

/* Timeline */
.timeline {
  position: relative;
  padding-left: 30px;
}

.timeline::before {
  content: '';
  position: absolute;
  left: 0;
  top: 0;
  bottom: 0;
  width: 2px;
  background: #e2e8f0;
}

.timeline-item {
  position: relative;
  margin-bottom: 30px;
}

.timeline-item::before {
  content: '';
  position: absolute;
  left: -35px;
  top: 5px;
  width: 12px;
  height: 12px;
  background: #2563eb;
  border-radius: 50%;
  border: 3px solid white;
  box-shadow: 0 0 0 2px #2563eb;
}

.timeline-date {
  font-weight: bold;
  color: #2563eb;
  margin-bottom: 5px;
}

.timeline-content {
  background: #f8fafc;
  padding: 15px;
  border-radius: 8px;
  border-left: 3px solid #2563eb;
}

.timeline-content strong {
  display: block;
  margin-bottom: 5px;
}

.institution {
  display: block;
  color: #64748b;
  margin-bottom: 5px;
}

.research-area {
  display: block;
  font-size: 0.9rem;
  color: #475569;
}

/* Tool Grid */
.tool-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 15px;
}

.tool-item {
  background: linear-gradient(135deg, #f5f7fa 0%, #e2e8f0 100%);
  padding: 20px;
  border-radius: 8px;
  text-align: center;
  transition: transform 0.3s ease;
}

.tool-item:hover {
  transform: translateY(-5px);
}

/* Lists */
.publication-list,
.teaching-list,
.positions-list,
.awards-list {
  list-style: none;
  padding: 0;
  margin: 0;
}

.publication-list li,
.teaching-list li,
.positions-list li,
.awards-list li {
  margin-bottom: 15px;
  padding-left: 25px;
  position: relative;
  line-height: 1.6;
}

.publication-list li::before,
.teaching-list li::before,
.positions-list li::before {
  content: '📌';
  position: absolute;
  left: 0;
  top: 2px;
}

.awards-list {
  counter-reset: award-counter;
}

.awards-list li {
  counter-increment: award-counter;
}

.awards-list li::before {
  content: counter(award-counter) '. ';
  font-weight: bold;
  color: #2563eb;
  position: absolute;
  left: 0;
  top: 0;
}

/* Hobby Grid */
.hobby-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 20px;
}

.hobby-item {
  display: flex;
  align-items: center;
  background: #f0f9ff;
  padding: 20px;
  border-radius: 10px;
  transition: transform 0.3s ease;
}

.hobby-item:hover {
  transform: translateY(-5px);
}

.hobby-icon {
  font-size: 2rem;
  margin-right: 20px;
}

.hobby-info strong {
  display: block;
  margin-bottom: 5px;
  color: #2563eb;
}

.hobby-info p {
  margin: 0;
  color: #64748b;
  font-size: 0.9rem;
}

/* WeChat Section */
.wechat-container {
  display: flex;
  flex-wrap: wrap;
  gap: 40px;
  align-items: center;
  justify-content: center;
}

.wechat-info {
  flex: 1;
  min-width: 300px;
}

.wechat-info h3 {
  margin-top: 0;
  color: #2563eb;
}

.wechat-qrcode {
  text-align: center;
}

.qrcode-img {
  width: 200px;
  height: 200px;
  border: 5px solid #f0f9ff;
  border-radius: 10px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  margin-bottom: 15px;
}

.qrcode-desc {
  margin: 0;
  color: #64748b;
  font-weight: bold;
}

/* Responsive Design */
@media (max-width: 768px) {
  .cv-container {
    padding: 10px;
  }
  
  .section-content {
    padding: 20px;
  }
  
  .section-header {
    padding: 15px 20px;
  }
  
  .hero-content h1 {
    font-size: 2rem;
  }
  
  .wechat-container {
    flex-direction: column;
    text-align: center;
  }
  
  .hobby-grid {
    grid-template-columns: 1fr;
  }
}
</style>

