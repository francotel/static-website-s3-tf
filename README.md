# Deploying a Static Website on AWS Using S3 and CloudFront

🌐 This repository contains the configuration for deploying a static website on AWS using S3 for hosting and CloudFront for content delivery.

## Requirements 📋

- Terraform >= [1.6.6]
- AWS CLI >= [2.13.28]
- Git >= [2.37.1]
- AWS account with IAM credentials with appropriate permissions
- Configuration of secrets in GitHub for AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, and AWS_DEFAULT_REGION

## Development 🛠️

1. **Clone the repository:**
    ```bash
    git clone https://github.com/francotel/static-website-s3-tf.git
    cd static-website-s3-tf
    ```
2. **Diagram:**

    ![Diagram aws](https://media.licdn.com/dms/image/D5612AQGxq3V27-vx9g/article-inline_image-shrink_1000_1488/0/1703285810199?e=1709164800&v=beta&t=9grKLAMhmr1JhxRXpIqx3g5rbtDSEsP8f74LRNEC7IQ)

## Advantages of Amazon S3 📦

1. **Scalability & Durability:** S3 offers high scalability and exceptional durability, ensuring data integrity for large-scale storage needs.

2. **Cost-Effectiveness:** Its pay-as-you-go pricing model allows payment for only the storage and data transfer utilized.

3. **User-Friendly:** Provides an intuitive interface and robust API for managing and accessing stored data.

4. **Security:** Offers advanced security options including access control policies, encryption, and auditing.

## Advantages of Amazon CloudFront ☁️

1. **Speed & Performance:** CloudFront uses a global network of servers (edge locations) to distribute content from closer locations, enhancing load speed.

2. **Auto-Scaling:** Automatically scales to handle traffic spikes, ensuring consistent performance during high-demand periods.

3. **Bandwidth Optimization:** Reduces origin server load by caching static and dynamic content, minimizing load on the origin infrastructure.

4. **Advanced Security:** Provides security features like SSL/TLS, DDoS protection, and options to restrict content access.

## Common Use Cases 🚀

- **Static Websites:** S3 is ideal for hosting static sites like web pages, blogs, or single-page applications (SPAs).

- **Media Streaming & Large File Storage:** S3 facilitates easy storage and delivery of multimedia content, such as videos, music, or large files.

- **Global Content Distribution:** CloudFront accelerates global content delivery, ensuring faster content delivery to end-users.

- **Scalable Web Applications:** The combination of S3 and CloudFront suits applications requiring scalability and global performance, such as enterprise applications or streaming services.


## GitHub Actions 🚀

```yaml
name: Deploy Terraform to AWS

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Setup Terraform
        uses: hashicorp/setup-terraform@v1
        with:
          cli_config_credentials_token: ${{ secrets.AWS_ACCESS_KEY_ID }}
          cli_config_credentials_secret: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws_region: ${{ secrets.AWS_DEFAULT_REGION }}

      - name: Terraform Init
        run: terraform init

      - name: Terraform Plan
        run: terraform plan -out=tfplan

      - name: Terraform Apply
        run: terraform apply tfplan -auto-approve
```

  ![web deploy](https://media.licdn.com/dms/image/D5612AQFbKGMRMsahPQ/article-inline_image-shrink_1500_2232/0/1703285113281?e=1709164800&v=beta&t=QE4hBSEo0O4W2W_w_YbDzl7hCr4t8R267OvdMc81TYM)

## Contributions 🤝

Contributions are welcome! If you'd like to enhance this project, feel free to submit a pull request.

## ☕ Support This Project

If you found this project helpful or useful and would like to support its development, consider buying me a coffee! Your support helps in maintaining and improving this project.

[![Buy Me a Coffee](https://img.shields.io/badge/Buy%20Me%20a%20Coffee-%E2%98%95-yellow)](https://www.buymeacoffee.com/francotel)

Your contribution means a lot! Thank you for your support! ❤️

## License 📄

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT) - see the [LICENSE](LICENSE) file for details.