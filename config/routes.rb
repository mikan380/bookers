Rails.application.routes.draw do
  # 1. アプリケーショントップ画面をルートパスに設定（トップ画面が homes コントローラーの top アクションの場合）
  root to: 'homes#top'

  # 2. resources メソッドを使って books のルーティングを1行にまとめる
  resources :books

  # --- 以下はそのまま残してOKです ---
  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files...
  # (PWA設定などのコメントアウト部分はそのまま)
end
