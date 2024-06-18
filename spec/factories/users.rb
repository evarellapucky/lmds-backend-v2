FactoryBot.define do
  factory :user do
    email { "test@example.com" }
    password { "Password1!" }
    password_confirmation { "Password1!" }
    role { "Etudiant" } # Vous pouvez également utiliser `ROLES.sample` pour un rôle aléatoire
    first_name { "John" }
    last_name { "Doe" }
    is_subscriber { true }
    subscription_end_date { 1.year.from_now }

    trait :admin do
      role { "Admin" }
    end

    trait :professor do
      role { "Professeur" }
    end

    trait :subscriber do
      is_subscriber { true }
      subscription_end_date { 1.year.from_now }
    end

    trait :non_subscriber do
      is_subscriber { false }
      subscription_end_date { nil }
    end
  end
end