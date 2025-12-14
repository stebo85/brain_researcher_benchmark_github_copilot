# Security Policy

## Overview

This repository implements an automated brain imaging analysis system that executes code from markdown files. Understanding and following these security practices is crucial for safe operation.

## Security Model

### Threat Model

This system is designed for use in controlled environments with trusted collaborators. The security model assumes:

1. **Trusted Repository Collaborators**: Only trusted users have write access to the repository
2. **Code Review**: All analysis files are reviewed before merging
3. **Protected Branches**: Main branch requires pull request reviews
4. **Isolated Execution**: GitHub Actions runners are isolated, ephemeral environments

### By Design: Code Execution from Markdown

**Important**: This system intentionally executes code from markdown analysis files. This is a core feature that enables flexible, autonomous brain imaging analyses.

**Implications**:
- Analysis markdown files can contain arbitrary bash commands
- These commands execute with the permissions of the GitHub Actions runner
- Container commands are executed within Singularity/Apptainer containers

## Security Measures

### 1. Input Sanitization

The system implements several input sanitization measures:

```bash
# File names are sanitized to prevent directory traversal
ANALYSIS_NAME=$(basename "$ANALYSIS_FILE" .md | tr -cd '[:alnum:]_-')

# Container names are sanitized
CONTAINER=$(... | tr -cd '[:alnum:]_-')
```

### 2. Cryptographic Verification

**CVMFS Security**:
- Uses HTTP with cryptographic verification (industry standard for CVMFS)
- Content integrity verified via public key cryptography
- Signed manifests ensure authenticity of container images
- Official Neurodesk public key from https://www.neurodesk.org/

### 3. Container Isolation

**Singularity/Apptainer**:
- Containers provide process isolation
- Limited access to host filesystem
- Non-privileged execution (no root inside containers)

### 4. GitHub Actions Security

**Runner Isolation**:
- Each workflow runs in a fresh, isolated environment
- Runners are destroyed after execution
- No persistence of secrets between runs

**Repository Permissions**:
```yaml
permissions:
  contents: write        # Required to commit results
  pull-requests: write   # Required for automated workflows
```

## Best Practices

### For Repository Administrators

1. **Enable Branch Protection**:
   - Require pull request reviews before merging
   - Require status checks to pass
   - Restrict who can push to main branch

2. **Review Analysis Files**:
   - Carefully review all analysis markdown files
   - Check bash code blocks for malicious commands
   - Verify container and command specifications
   - Look for suspicious patterns (e.g., `curl | bash`, external downloads)

3. **Limit Collaborator Access**:
   - Only grant write access to trusted collaborators
   - Use read-only access for external contributors
   - Require pull requests from all contributors

4. **Monitor Workflow Executions**:
   - Review GitHub Actions logs regularly
   - Check for unexpected behavior
   - Monitor resource usage

### For Analysis Authors

1. **Document Your Analysis**:
   - Clearly describe what your analysis does
   - Document all external dependencies
   - Explain any network access requirements

2. **Minimize Permissions**:
   - Request only necessary containers
   - Use minimal command sets
   - Avoid privileged operations

3. **Handle Data Safely**:
   - Never commit sensitive data
   - Use .gitignore for data files
   - Follow HIPAA/GDPR requirements for protected data
   - Be aware that results are committed to the repository

4. **Test Locally First**:
   - Test bash scripts locally before committing
   - Verify commands in containers
   - Check for errors and edge cases

### For Users Running Analyses

1. **Review Before Running**:
   - Read the entire analysis file
   - Understand what commands will execute
   - Verify the source/author is trusted

2. **Use Pull Requests**:
   - Submit analyses via pull requests
   - Request review from maintainers
   - Don't push directly to main branch

3. **Report Suspicious Activity**:
   - Report any unusual behavior
   - Flag potentially malicious analysis files
   - Contact maintainers with concerns

## Known Security Considerations

### 1. Arbitrary Code Execution

**Nature**: Analysis files can contain arbitrary bash commands  
**Mitigation**: Code review, trusted collaborators, isolated execution environment  
**Residual Risk**: Low in controlled environment with trusted users

### 2. Container Image Trust

**Nature**: Container images from Neurodesk CVMFS repository  
**Mitigation**: Cryptographic verification via public key, signed manifests  
**Residual Risk**: Low - relies on Neurodesk security practices

### 3. Network Access

**Nature**: Containers may have network access  
**Mitigation**: GitHub Actions network isolation, container isolation  
**Residual Risk**: Medium - containers could potentially access external resources

### 4. Data Exfiltration

**Nature**: Malicious analysis could exfiltrate data  
**Mitigation**: Code review, monitoring, trusted collaborators  
**Residual Risk**: Low in controlled environment

### 5. Resource Consumption

**Nature**: Analysis could consume excessive resources  
**Mitigation**: GitHub Actions timeouts, runner resource limits  
**Residual Risk**: Low - GitHub enforces limits

## Incident Response

If you discover a security issue:

1. **Do Not** create a public issue
2. **Do** contact the repository administrators directly
3. **Do** provide detailed information about the vulnerability
4. **Do** wait for a coordinated disclosure

### Reporting a Vulnerability

Email repository maintainers with:
- Description of the vulnerability
- Steps to reproduce
- Potential impact assessment
- Suggested mitigation (if any)

## Security Updates

This document will be updated as:
- New security features are added
- Vulnerabilities are discovered and fixed
- Best practices evolve

## Compliance

### Data Protection

If analyzing protected health information (PHI) or personal data:

1. **HIPAA Compliance**:
   - Ensure Business Associate Agreements are in place
   - Use private repositories only
   - Implement access controls
   - Maintain audit logs

2. **GDPR Compliance**:
   - Document data processing activities
   - Implement data minimization
   - Provide data protection impact assessment
   - Enable data deletion capabilities

3. **Institutional Requirements**:
   - Follow your institution's data governance policies
   - Obtain necessary IRB approvals
   - Document data handling procedures

## Security Checklist

Before deploying to production:

- [ ] Branch protection rules enabled
- [ ] Required reviewers configured
- [ ] All collaborators are trusted
- [ ] Security policy reviewed by team
- [ ] Data handling procedures documented
- [ ] Compliance requirements addressed
- [ ] Incident response plan in place
- [ ] Regular security audits scheduled

## Additional Resources

- [GitHub Actions Security Best Practices](https://docs.github.com/en/actions/security-guides/security-hardening-for-github-actions)
- [CVMFS Security Documentation](https://cvmfs.readthedocs.io/en/stable/cpt-security.html)
- [Neurodesk Documentation](https://www.neurodesk.org/docs/)
- [Singularity Security](https://sylabs.io/guides/3.0/user-guide/security.html)

## Version

**Document Version**: 1.0  
**Last Updated**: 2024-12-14  
**Next Review**: 2025-03-14
