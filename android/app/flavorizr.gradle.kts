import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("staging") {
            dimension = "flavor-type"
            applicationId = "dev.iamutaki.jnn_mobile.staging"
            resValue(type = "string", name = "app_name", value = "JNN Mobile (Staging)")
        }
        create("production") {
            dimension = "flavor-type"
            applicationId = "dev.iamutaki.jnn_mobile"
            resValue(type = "string", name = "app_name", value = "JNN Mobile")
        }
    }

    buildFeatures.resValues = true
}