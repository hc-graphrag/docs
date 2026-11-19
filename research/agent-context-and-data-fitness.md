# AIエージェント向けRAGの設計根拠

## 行動コンテキストとデータ適合性に関する調査

この資料は、AIエージェント向けRAGの設計判断を支える一次資料と研究結果を整理します。対象は、行動段階ごとのコンテキスト、ユースケースとデータの適合性、データの利用可能性、由来・来歴、GraphRAGの公式機能、評価方法です。

## 1. 結論

AIエージェント向けRAGでは、ユーザーが求める業務成果からエージェントの行動を定め、状況認識、計画、情報取得、判断、ツール実行、結果検証の各段階に必要なコンテキストを供給します。

同時に、次の境界を明確にします。

- RAGの原著論文は、検索可能な外部記憶を生成モデルへ結合する方式を示しています。
- Agentic RAGは、エージェントが検索の要否、検索内容、検索経路、反復、検証を制御する拡張です。
- エージェントの行動全体には、検索知識に加えて、ユーザー目的、現在状態、ツール仕様、権限、業務規則、承認条件、完了条件が必要です。
- Microsoft GraphRAGは、グラフと階層要約を使って検索・回答用コンテキストを構築する基盤です。エージェント実行、ツール権限、業務トランザクション、完了判定は、連携するAIエージェント基盤で設計します。
- 設計資料では、GraphRAGの索引・検索層と、AIエージェントの行動・実行・評価を担う層を分けて扱います。

### 1.1 設計資料への反映先

| 調査結果 | 反映先 |
|---|---|
| ユースケース、データ、利用条件の適合性 | [ユースケース・データ適合アセスメント](../enterprise-data-assessment.md) |
| RAG、GraphRAG、AIエージェントの責任境界 | [AIエージェント向けRAGシステムモデル](../rag-system-model.md) |
| 圧縮、階層化、復元、コンテキスト編成 | [情報変換の原理](../information-compression-and-context-injection.md) |
| RAG品質とエージェント行動の測定 | [段階別評価方式](../evaluation.md) |
| 適用工程と成果物 | [AIエージェント・GraphRAGシステム導入支援の進め方](../graphrag-delivery-model.md) |

### 1.2 調査結果から区別する二つの判断

データ適合性に関する研究とGraphRAGの公式仕様は、異なる段階を扱っています。本資料では、設計上の判断を次の二つに分けます。

| 段階 | 判断対象 | 根拠となる資料 | 反映先 |
|---|---|---|---|
| 導入前 | ユースケースに対する情報の充足、データ配置、提供元承認、加工・派生データの利用条件 | Datasheets、Data Cards、Data Readiness、PROV-O、クラウド権限資料 | 適合アセスメント |
| 稼働時 | 要求に合う情報の取得とコンテキスト構築 | Microsoft GraphRAGの索引・検索仕様 | RAGシステムモデル |

この区別により、導入判断の根拠と実行時検索の評価を別々に記録できます。

## 2. RAG、Agentic RAG、エージェント基盤の境界

### 2.1 RAGの原著論文

Lewisらの原著論文は、事前学習済み生成モデルのパラメトリック記憶と、検索可能な非パラメトリック記憶を結合する方式を示しています。知識集約型NLPタスク、生成、知識更新、出典が主題です。

- Patrick Lewis et al., [Retrieval-Augmented Generation for Knowledge-Intensive NLP Tasks](https://arxiv.org/abs/2005.11401)

本調査では、この構成をRAGの基準定義とし、AIエージェントへ適用するときに追加される設計要素を整理します。

### 2.2 Agentic RAG

Agentic RAGの研究では、固定されたretrieve-then-generateから、エージェントが計画、検索、推論、反省、ツール利用を反復する構成へ発展しています。

- [Agentic Retrieval-Augmented Generation: A Survey on Agentic RAG](https://arxiv.org/abs/2501.09136) は、reflection、planning、tool use、multi-agent collaborationをAgentic RAGの主要パターンとして整理しています。
- [Towards Agentic RAG with Deep Reasoning](https://arxiv.org/abs/2507.09477) は、検索が推論へ前提を供給し、推論が検索の各段階を制御する双方向関係を整理しています。
- [RAG-Gym](https://arxiv.org/abs/2502.13957) は、複雑な課題では検索と推論を逐次的に行い、各検索段階を評価・最適化する必要を示しています。
- [Data-Centric Perspectives on Agentic Retrieval-Augmented Generation](https://aclanthology.org/2026.findings-acl.78/) は、Agentic RAGに必要なデータを、計画、検索、複数回の判断を含む課題と、対応する対話的な行動軌跡として整理しています。

Agentic RAGは、エージェントの状態と進行中の行動に応じて、検索とコンテキストを動的に変えます。

### 2.3 エージェントの行動ループ

[ReAct](https://arxiv.org/abs/2210.03629) は、推論と環境への行動を交互に行い、外部から得た観測によって計画を更新する構成を示しました。検索は外部行動の一つであり、取得した情報は次の推論と行動を変えます。

[Generative Agents](https://arxiv.org/abs/2304.03442) は、観測記録を蓄積し、上位のreflectionへ統合し、行動計画のために動的に検索するメモリアーキテクチャを示しました。記憶の検索結果は行動計画に使われます。

[MemGPT](https://arxiv.org/abs/2310.08560) は、限られたコンテキストウィンドウへ必要な情報を出し入れするvirtual context managementを提案し、コンテキスト管理をエージェントの制御問題として扱っています。

[A Survey of Context Engineering for Large Language Models](https://arxiv.org/abs/2507.13334) は、context retrieval、generation、processing、managementを基礎要素として整理し、RAG、memory、tool-integrated reasoning、multi-agent systemsを統合先として位置付けています。

これらから、AIエージェント向けRAGでは、取得結果を最終回答と行動ループの各段階へ、目的に応じて供給する設計が必要です。

## 3. 行動段階ごとのコンテキスト

次の区分は、ReAct、Generative Agents、MemGPT、Agentic RAG研究を業務導入向けに統合した、本資料の設計モデルです。

| 行動段階 | エージェントが行うこと | RAGから供給するコンテキスト | RAG以外から必要なコンテキスト |
|---|---|---|---|
| 目的理解 | ユーザーの依頼と期待成果を解釈する | 関連する業務概念、対象、過去事例 | ユーザー指示、業務目標、優先順位 |
| 状況認識 | 現在状態と対象範囲を把握する | 最新記録、対象実体、関係、時点 | セッション状態、環境観測、現在の権限 |
| 計画 | 手順、依存関係、確認順序を組み立てる | 手順書、過去計画、依存関係、例外 | 利用可能なツール、費用・時間、承認経路 |
| 取得・探索 | 不足情報を特定し、検索を反復する | 局所証拠、全体要約、反証、次の探索候補 | 検索状態、既取得情報、未解決点 |
| 判断 | 証拠と制約を統合して次の行動を選ぶ | 事実、関係、版、出所、矛盾、信頼度 | 業務規則、リスク許容度、決裁条件 |
| ツール実行 | APIや業務システムへ入力する | 対象ID、根拠、入力候補、関連状態 | ツールスキーマ、実行権限、副作用、確認済み入力 |
| 結果検証 | 実行結果と期待状態を比較する | 期待結果、根拠、過去状態、関連記録 | 実行ログ、更新後状態、完了・撤回条件 |

この表から、RAGが供給する知識コンテキストと、エージェント基盤が保持する実行コンテキストを区別します。設計資料では、両者の接続点と責任主体を記録します。

## 4. 検索は行動に応じて変化する

検索方式と取得する情報は、エージェントの行動段階に応じて変化します。

- [FLARE](https://arxiv.org/abs/2305.06983) は、生成の途中で低確信の内容を検出し、必要な情報を逐次取得します。
- [Self-RAG](https://arxiv.org/abs/2310.11511) は、検索の要否を適応的に判断し、取得文書と生成内容を自己評価します。
- [Agentic-R](https://aclanthology.org/2026.findings-acl.785/) は、単一ターンの局所的な関連度と複数ターンの最終結果を使ってretrieverを評価・学習します。
- [GRASP](https://aclanthology.org/2026.findings-emnlp.1226/) は、検索方式とコンテキスト粒度をエージェントが動的に選ぶ必要を扱っています。
- [Memory as a Controlled Process](https://arxiv.org/abs/2607.13591) は、タスクの段階、反復する目標、行き詰まりなどに応じて、検索、計画再利用、再検索、統合、忘却を変える制御問題としてメモリを扱っています。

したがって、取得文書の正しさと、各行動段階へ必要なコンテキストを必要な時点・粒度で供給できたかを評価します。

## 5. ユースケースとデータの適合性

### 5.1 タスク適合性を先に確認する根拠

[Datasheets for Datasets](https://arxiv.org/abs/1803.09010) は、データのmotivation、composition、collection process、recommended uses、distribution、maintenanceを文書化し、データ作成者と利用者の判断を支えることを提案しています。

[Data Cards](https://arxiv.org/abs/2204.01075) は、上流ソース、収集・アノテーション方法、意図した用途、性能へ影響する判断、データの発展経緯を、利用者が判断できる形で示す必要を整理しています。

[Data Readiness Levels](https://arxiv.org/abs/1705.02245) は、保存場所、欠損、知的財産、セキュリティ、プライバシー、解釈可能性をデータ準備の観点として整理しています。

これらは、データの存在とユースケースへの適合を分けて判定する根拠になります。

### 5.2 研究から得られる設計上の含意

| 研究・標準 | 調査結果 | 設計資料への反映 |
|---|---|---|
| Datasheets for Datasets | 作成目的、構成、収集過程、推奨用途、保守を記録する | データの目的と利用条件を確認する |
| Data Cards | 上流ソース、作成判断、意図した用途、発展経緯を示す | 由来と適用範囲を確認する |
| Data Readiness Levels | 技術、法務、セキュリティ、解釈可能性を段階的に扱う | 追加準備と導入条件を記録する |
| PROV-O | Entity、Activity、Agentと派生関係を表現する | 原情報からコンテキストまでの来歴を追跡する |

具体的な確認項目は[ユースケース・データ適合アセスメント](../enterprise-data-assessment.md)へ反映します。

### 5.3 データの利用可能性

ユースケースとの内容上の適合に加えて、元データからコンテキストまでの各処理を実行できることが導入条件になります。データの配置先、提供元の承認、取得主体、加工ジョブ、派生データの保存先、利用終了時の処置を一続きの条件として扱います。

調査したクラウド上の承認・権限モデルは[既存評価研究とデータ準備資料](rag-assessment-frameworks.md)、案件で確認する項目は[ユースケース・データ適合アセスメント](../enterprise-data-assessment.md#6-データ配置権限フローのアセスメント)に整理します。

## 6. 由来と来歴

W3C [PROV-O](https://www.w3.org/TR/prov-o/) は、Entity、Activity、Agentを中心に、生成、使用、派生、帰属、関連、委任を表現します。原情報、変換処理、処理主体を分けて記録する共通語彙として利用できます。

この資料では、次のように区別します。

- 由来: 原情報が誰・何によって、どの過程と目的から生じたか。
- 来歴: 原情報が、取得、抽出、正規化、分割、実体統合、要約、検索、コンテキスト編成を経て、エージェントへ届くまでの変換履歴。

NIST [AI RMF Generative AI Profile](https://doi.org/10.6028/NIST.AI.600-1) も、入力データ、メタデータ、合成コンテンツのoriginとhistoryを追跡し、下流への影響と制約を確認するためのprovenance管理を扱っています。

## 7. GraphRAGが担う範囲

Microsoft GraphRAGの公式資料では、Indexing DataflowがDocument、TextUnit、Entity、Relationship、Covariate、Community、Community Reportを生成します。TextUnitとDocument、実体・関係とTextUnitの参照は、原文へ戻るための基礎になります。

- [GraphRAG Indexing Dataflow](https://microsoft.github.io/graphrag/index/default_dataflow/)
- [GraphRAG Outputs](https://microsoft.github.io/graphrag/index/outputs/)

Query Engineは、完成した索引に対してLocal Search、Global Search、DRIFT Search、Basic Search、Question Generationを提供します。

- [GraphRAG Query Engine](https://microsoft.github.io/graphrag/query/overview/)

公式資料から確認できるGraphRAGの中心は、非構造テキストからグラフと階層要約を作り、質問に応じてLLMコンテキストを構築することです。次の機能は、対象業務への導入時に追加する設計として分けます。

- ユーザー成果とエージェント行動契約の管理
- 業務システムのツールスキーマと実行権限
- 副作用を伴う操作の承認と停止
- 原データの行列・座標・業務IDを保持する取り込み
- 行レベル・列レベル・実体関係レベルの権限
- 元データから派生データまでの権限伝播と期限管理
- 外部システムへの更新・削除伝播
- エージェントの行動軌跡、実行結果、完了状態の評価

GraphRAGは行動用コンテキストの構築・検索基盤を担います。エージェント実行基盤は、GraphRAGから供給するコンテキストを利用する構成として設計します。

## 8. 評価方式

RAG固有の評価と、エージェント行動の評価を分けます。

### 8.1 RAG固有の評価

[RAGAS](https://aclanthology.org/2024.eacl-demo.16/) と [ARES](https://aclanthology.org/2024.naacl-long.20/) は、取得コンテキストの関連性、回答の忠実性、回答の関連性を評価します。これらは検索・生成層の評価に使えます。

### 8.2 エージェント行動の評価

[AgentBench](https://arxiv.org/abs/2308.03688) は、対話的環境での長期推論、意思決定、指示追従を評価します。[τ-bench](https://arxiv.org/abs/2406.12045) は、ユーザー目標、業務ポリシー、APIツールを与え、会話終了時のデータベース状態を目標状態と比較します。また、複数回の試行で行動の信頼性を評価します。

AIエージェント向けRAGの評価には、次の二層が必要です。

| 評価層 | 主な評価 |
|---|---|
| RAG・コンテキスト層 | 必要証拠の取得、忠実性、由来・来歴、版、配置、承認、派生データ権限、コンテキスト利用 |
| エージェント行動層 | ユーザー目標の達成、最終状態、ツール選択、入力値、業務規則、停止・承認、再現性 |

AIエージェント向けRAGの評価では、検索・生成品質と、ツール実行、業務規則、目標状態への到達を組み合わせて判定します。

## 9. 設計資料への反映

本資料で確認した根拠は、各設計資料の判断に反映しています。お客様向けの案内、アセスメントの記入項目、システムの責任分界、評価基準は、それぞれの目的に応じた粒度で記載しています。
