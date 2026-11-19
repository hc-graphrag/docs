# 参考事例と一次資料

最終確認日: 2026-11-18。設計判断の前に、対象バージョンの一次資料を確認します。

## RAGの基礎

- Patrick Lewis et al., [Retrieval-Augmented Generation for Knowledge-Intensive NLP Tasks](https://arxiv.org/abs/2005.11401)。パラメトリック記憶と、検索可能な非パラメトリック記憶を生成へ結合するRAGの基本構成を示した原著論文。
- Kelvin Guu et al., [REALM: Retrieval-Augmented Language Model Pre-Training](https://arxiv.org/abs/2002.08909)。大規模コーパスから文書を取得し、言語モデルが参照する構成。
- Vladimir Karpukhin et al., [Dense Passage Retrieval for Open-Domain Question Answering](https://aclanthology.org/2020.emnlp-main.550/)。質問とパッセージを密ベクトルで照合する候補取得。
- Omar Khattab and Matei Zaharia, [ColBERT](https://arxiv.org/abs/2004.12832)。トークン単位の遅延相互作用による効率的な検索・順位付け。
- Gautier Izacard and Edouard Grave, [Fusion-in-Decoder](https://aclanthology.org/2021.eacl-main.74/)。複数の取得パッセージを個別に符号化し、生成段階で証拠を統合する方法。

## 階層化・圧縮・コンテキスト編成

- Parth Sarthi et al., [RAPTOR](https://arxiv.org/abs/2401.18059)。チャンクをクラスタリング・要約して再帰的な木を作り、複数の抽象度から取得する方法。
- Fangyuan Xu et al., [RECOMP](https://proceedings.iclr.cc/paper_files/paper/2024/hash/bda88ed2892f5e61c9a9bf215c566913-Abstract-Conference.html)。取得文書を抽出的・生成的に圧縮し、選択的にコンテキストへ追加する方法。
- Nelson F. Liu et al., [Lost in the Middle](https://aclanthology.org/2024.tacl-1.9/)。長いコンテキスト内で、関連情報の位置が利用性能へ与える影響。
- Huiqiang Jiang et al., [LongLLMLingua](https://arxiv.org/abs/2310.06839)。長いコンテキストでの情報密度、位置、圧縮を扱う方法。

## 上位原理

- Claude E. Shannon, [A Mathematical Theory of Communication](https://web.mit.edu/6.441/spring05/reading/shannon1948.pdf)。情報量と符号化の基礎。
- Naftali Tishby, Fernando C. Pereira, William Bialek, [The Information Bottleneck Method](https://arxiv.org/abs/physics/0004057)。目的に有用な情報を保持しながら入力を圧縮する枠組み。

## GraphRAG

- Darren Edge et al., [From Local to Global: A Graph RAG Approach to Query-Focused Summarization](https://arxiv.org/abs/2404.16130)。実体グラフ、コミュニティ要約、部分回答の統合を用いた全体質問への方法。
- Microsoft GraphRAG, [Indexing Dataflow](https://microsoft.github.io/graphrag/index/default_dataflow/)。Document、TextUnit、実体、関係、主張、コミュニティ、レポート、埋め込みへ至る変換。
- Microsoft GraphRAG, [Indexing Methods](https://microsoft.github.io/graphrag/index/methods/)。実体・関係抽出、要約、標準方式と高速方式の構成。
- Microsoft GraphRAG, [Query methods](https://microsoft.github.io/graphrag/query/overview/)。local、global、DRIFT、basic searchの公式説明。
- [Microsoft GraphRAG repository](https://github.com/microsoft/graphrag)。公開実装。
- [Microsoft GraphRAG benchmarking datasets](https://github.com/microsoft/graphrag-benchmarking-datasets)。公開ベンチマーク用データ。

## データ配置・権限・来歴

- AWS, [Amazon DataZone data discovery, subscription, and consumption](https://docs.aws.amazon.com/datazone/latest/userguide/discover-subscribe-consume-data.html)。データ利用申請、所有者による承認、アクセス付与の流れ。
- AWS, [Metadata enforcement rules for subscription requests](https://docs.aws.amazon.com/datazone/latest/userguide/metadata-rules.html)。利用理由の審査と行・列単位の承認範囲。
- AWS IAM, [Temporary security credentials](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp.html)。委任、クロスアカウントアクセス、期限付き認証情報。
- AWS Glue, [Review IAM permissions needed for ETL jobs](https://docs.aws.amazon.com/glue/latest/dg/getting-started-min-privs-job.html)。加工ジョブの入力元、出力先、一時領域、暗号鍵に必要な権限。
- AWS Lake Formation, [Overview of Lake Formation permissions](https://docs.aws.amazon.com/lake-formation/latest/dg/lf-permissions-overview.html)。カタログ、保存場所、実データ、IAMの権限境界。
- Amazon S3, [Access control](https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-management.html)。オブジェクト所有者、資源ポリシー、クロスアカウント共有。
- W3C, [PROV-O: The PROV Ontology](https://www.w3.org/TR/prov-o/)。Entity、Activity、Agentと派生関係による来歴表現。

## AIエージェント評価

- Xiao Liu et al., [AgentBench: Evaluating LLMs as Agents](https://openreview.net/forum?id=zAdUB0aCTQ)。複数の対話環境における推論、意思決定、指示追従の評価。
- Chang Ma et al., [AgentBoard](https://proceedings.neurips.cc/paper_files/paper/2024/hash/877b40688e330a0e2a3fc24084208dfa-Abstract-Datasets_and_Benchmarks_Track.html)。最終成功率と途中到達度を分ける分析的評価。
- Shunyu Yao et al., [τ-bench](https://arxiv.org/abs/2406.12045)。利用者、業務ルール、API、最終状態、複数試行の信頼性を扱うベンチマーク。
- Jiarui Lu et al., [ToolSandbox](https://arxiv.org/abs/2408.04682)。状態依存のツール利用と、必須・禁止事象による行動過程の評価。
- Microsoft, [STATE-Bench](https://opensource.microsoft.com/blog/2026/05/19/introducing-state-bench-a-benchmark-for-ai-agent-memory/)。企業業務を想定した完了率、反復成功、効率、利用体験の公開評価事例。

## 実装資料

- [hc-graphrag/llamaindex-python](https://github.com/hc-graphrag/llamaindex-python)。GraphRAGを技術基盤として利用する実装です。local、global、DRIFTに関連するコードを含みます。
- [既存実装の検索コード](https://github.com/hc-graphrag/llamaindex-python/tree/main/src/graphrag_anthropic_llamaindex)
- LlamaIndex, [Loading Data](https://developers.llamaindex.ai/python/framework/module_guides/loading/)。取り込み、変換、Node生成。
- LlamaIndex, [Retriever](https://developers.llamaindex.ai/typescript/framework/modules/rag/retriever/)。複数の取得方式。
- LlamaIndex, [Node Postprocessors](https://developers.llamaindex.ai/python/framework/module_guides/querying/node_postprocessors/node_postprocessors/)。取得後の変換、フィルタ、再順位付け。
- LlamaIndex, [Response Synthesizer](https://developers.llamaindex.ai/typescript/framework/modules/rag/response_synthesizer/)。取得ノードの統合と回答生成。

## 設計資料からの参照先

| 設計資料 | 主に参照する資料 |
|---|---|
| [AIエージェント向けRAGシステムモデル](../rag-system-model.md) | RAGの原著論文、Microsoft GraphRAG公式資料、AWSのデータ・権限モデル |
| [情報圧縮・階層化・復元・コンテキスト注入の原理](../information-compression-and-context-injection.md) | Shannon、Information Bottleneck、RAPTOR、RECOMP、Lost in the Middle、PROV-O |
| [段階別評価方式](../evaluation.md) | RAG評価研究、GraphRAGの索引・検索仕様、AIエージェント評価研究 |
| [業務ユースケース実証計画](../use-cases/validation-plan.md) | AgentBench、AgentBoard、τ-bench、ToolSandbox、STATE-Bench |
| [ユースケース・データ適合アセスメント](../enterprise-data-assessment.md) | データ準備、配置、提供元承認、加工・派生データ権限、来歴、GraphRAGの適用条件 |
