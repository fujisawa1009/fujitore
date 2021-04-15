<h2>URL</h2>
<p>Heroku https://toretomo.herokuapp.com/</p>
<p>AWS http://toretomo.work/</p>
<p>ログイン画面から【テストユーザー】としてゲストログインが可能です。</p>
<p>本ポートフォリオは、タブレット・スマートフォンからもご覧いただけます。</p>

<h3>ログインなしで使えない機能</h3>
<ul>
  <li>ジム、トレーナーへのコメントの作成、編集、削除</li>
  <li>トレーナーへのいいねの追加、削除</li>
</ul>

<h2>概要</h2>
<p>自分の住んでいる地域（現時点では大阪市内の区のみ）やカテゴリーなどから自分の理想のジムを探すことができ、それと同時にそれぞれのジムに契約または活動しているトレーナーを探せるアプリです。</p>

<p>作成した背景や想いなど、より詳細な情報は下記をご覧ください。</p>
<a href="https://qiita.com/Takayaus/items/7372c10bbfaa0497eb59">ポートフォリオ（Toretomo）解説</a>

<h2>機能</h2>
<ul>
  <li>ユーザー登録・ログイン機能(Devise)</li>
  <li>管理画面(Active admin)</li>
  <li>いいね機能</li>
  <li>コメント機能</li>
  <li>五段階評価機能(Raty)</li>
  <li>一覧表示(一部にSwiper)</li>
  <li>文字列省略機能(Readmore)</li>
  <li>画像拡大機能(Lightbox2)</li>
  <li>ページネーション(Kaminari)</li>
  <li>検索機能(Ransack)</li>
  <li>地図機能(Google MapとGeocoder)</li>
  <li>お問い合わせフォーム(Action Mailer)</li>
</ul>

<h2>実装予定の機能</h2>
<ul>
  <li>非同期処理（コメント、いいね機能）</li>
  <li>テスト機能</li>
</ul>

<h2>開発しての気づき</h2>
<p>トレーナーとジムのデータ管理(登録、編集、削除)を主にActive adminにまかせているのですが、各詳細ページ(/show)で権限を１つのユーザーに持たせ、</br>
編集できるようにする方が簡単でみやすいのでいいのかなと思いました。</p>

<h2>使用技術</h2>
<ul>
  <li>Ruby 2.6.5, Rails 5.2.4</li>
  <li>HTML, SCSS, Javascript, jQuery</li>
  <li>Nginx, unicorn</li>
  <li>AWS (EC2, S3, VPC ,Route53)</li>
</ul>
