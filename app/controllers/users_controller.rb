class Users::SessionsController < Devise::SessionsController
    # ログイン後のリダイレクト先をカスタマイズ
    def after_sign_in_path_for(resource)
        return params[:return_to] || root_path # ログイン前のページが指定されていればそれを、そうでなければトップページにリダイレクト
    end
end

