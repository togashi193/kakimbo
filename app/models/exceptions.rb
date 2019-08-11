module Exceptions
  class CommonError < StandardError
    attr_reader :status, :title
  end

  class ApplicationError < CommonError
  end

  class BadRequest < ApplicationError
    def initialize(message = '不正なリクエストです。')
      super(message)
      @status = 400
    end
  end



  class Unauthorized < ApplicationError
    def initialize(message = '認証されていません。')
      super(message)
      @status = 401
    end
  end

  class NotFound < ApplicationError
    def initialize(message = 'リソースが見つかりません。')
      super(message)
      @status = 404
    end
  end

  class FirebaseAuthError < Unauthorized
    def initialize(message = 'firebaseの認証エラーです。')
      super(message)
    end
  end

  class InternalServerError < CommonError
    def initialize(message = 'サーバーのエラーです。')
      super(message)
      @status = 500
    end
  end
end
