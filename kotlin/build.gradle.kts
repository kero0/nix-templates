plugins {
    kotlin("jvm") version "1.9.21"
    application
}

application {
    mainClass = "org.example.MainKt"
}

sourceSets {
    main {
        kotlin.srcDir("src")
    }
}

tasks {
    wrapper {
        gradleVersion = "8.5"
    }
}
